require 'reform/form/validation/unique_validator'

module Tickets
  module Contracts
    class Create < Reform::Form
      property :request_number
      property :sequence_number
      property :request_type
      property :response_due_date_time
      property :primary_service_area_code
      property :additional_service_area_codes
      property :well_known_text
      property :excavator,
        populate_if_empty: Excavator, form: Tickets::Excavators::Contracts::Create, save: false

      with_options presence: true do
        validates :request_number, format: { with: /\A[\d\-]{,50}\z/ }, unique: true
        validates :sequence_number, format: { with: /\A\d{,50}\z/ }
        validates :request_type, length: { maximum: 50 }
        validates :response_due_date_time, timeliness: { type: :datetime }
        validates :primary_service_area_code, format: { with: /\A\w+\z/ }, length: { maximum: 50 }
        validates :additional_service_area_codes
        validates :well_known_text
      end

      validate do
        is_valid = Array(additional_service_area_codes).map(&:to_s).all? do |area_code|
          area_code.size <= 50 && area_code.match?(/\A\w+\z/)
        end

        errors.add(:additional_service_area_codes, :invalid) unless is_valid
      end

      validate do
        is_valid = TestProject::Polygon.instance.parse(well_known_text)

        errors.add(:well_known_text, :invalid) unless is_valid
      end
    end
  end
end

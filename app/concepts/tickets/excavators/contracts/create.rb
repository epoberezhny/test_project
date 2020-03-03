module Tickets
  module Excavators
    module Contracts
      class Create < Reform::Form
        property :company_name
        property :full_address
        property :crew_onsite

        with_options presence: true do
          validates :company_name, length: { maximum: 50 }
          validates :full_address, length: { maximum: 100 }
        end
      end
    end
  end
end

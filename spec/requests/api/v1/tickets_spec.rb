require 'swagger_helper'

RSpec.describe 'Tickets' do
  after do |example|
    example.metadata[:response][:examples] = {
      'application/json' => ActiveSupport::JSON.decode(response.body)
    }
  end

  path '/tickets' do
    post 'Create a ticket' do
      tags 'Tickets'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :ticket, in: :body, schema: {}

      response '201', 'Created' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            request_number: { type: :string },
            sequence_number: { type: :string },
            request_type: { type: :string },
            response_due_date_time: { type: :string, format: 'date-time' },
            primary_service_area_code: { type: :string },
            additional_service_area_codes: {
              type: :array,
              items: { type: :string }
            },
            well_known_text: { type: :string },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' },
            excavator: {
              type: :object,
              properties: {
                company_name: { type: :string },
                full_address: { type: :string },
                crew_onsite: { type: :boolean },
                ticket_id: { type: :integer },
                created_at: { type: :string, format: 'date-time' },
                updated_at: { type: :string, format: 'date-time' }
              },
              required: %i[
                company_name full_address crew_onsite ticket_id
                created_at updated_at
              ]
            }
          },
          required: %i[
            id request_number sequence_number request_type
            response_due_date_time primary_service_area_code
            additional_service_area_codes well_known_text
            created_at updated_at
          ]

        let(:ticket) do
          json = file_fixture('requests/api/v1/tickets/create.json').read
          ActiveSupport::JSON.decode(json)
        end
        run_test!
      end

      response '422', 'Unprocessable entity' do
        schema type: :object,
          properties: {
            errors: { type: :object },
          },
          required: %i[errors]

        let(:ticket) { {} }
        run_test!
      end
    end
  end
end

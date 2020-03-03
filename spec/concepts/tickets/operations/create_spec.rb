RSpec.describe Tickets::Operations::Create do
  subject(:result) { described_class.call(params: params) }

  let(:request) do
    json = file_fixture('requests/api/v1/tickets/create.json').read
    ActiveSupport::JSON.decode(json)
  end
  let(:params) { request.deep_transform_keys(&:underscore) }

  context 'success' do
    it 'creates ticket' do
      expect(result[:model]).to be_instance_of(Ticket)
      expect(result[:model]).to be_persisted
      expect(result[:model].excavator).to be_persisted
      expect(result[:model]).to have_attributes(
        request_number: request.dig('RequestNumber'),
        sequence_number: request.dig('SequenceNumber'),
        request_type: request.dig('RequestType'),
        response_due_date_time: Time.zone.parse(request.dig('DateTimes', 'ResponseDueDateTime')),
        primary_service_area_code: request.dig('ServiceArea', 'PrimaryServiceAreaCode', 'SACode'),
        additional_service_area_codes: request.dig('ServiceArea', 'AdditionalServiceAreaCodes', 'SACode'),
        well_known_text: request.dig('ExcavationInfo', 'DigsiteInfo', 'WellKnownText'),
        created_at: kind_of(Time),
        updated_at: kind_of(Time),
        excavator: have_attributes(
          company_name: request.dig('Excavator', 'CompanyName'),
          full_address: [
            request.dig('Excavator', 'Address'),
            request.dig('Excavator', 'City'),
            request.dig('Excavator', 'State'),
            request.dig('Excavator', 'Zip')
          ].join(', '),
          crew_onsite: true,
          created_at: kind_of(Time),
          updated_at: kind_of(Time)
        )
      )
      expect(result['contract.default']).to be_instance_of(Tickets::Contracts::Create)

      expect(result).to be_success
    end

    context 'failure' do
      context 'validation errors' do
        let(:params) { {} }

        it 'fails' do
          expect(result).to be_failure
          expect(result['result.contract.default']).to be_failure
          expect(result[:model]).not_to be_persisted
        end
      end
    end
  end
end

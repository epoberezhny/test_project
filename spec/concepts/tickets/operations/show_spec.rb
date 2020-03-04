RSpec.describe Tickets::Operations::Show do
  subject(:result) { described_class.call(params: params) }

  let(:params) { { id: ticket.id } }
  let(:ticket) { create(:ticket) }

  context 'success' do
    it 'returns paginated list of tickets' do
      expect(result[:model]).to eq(ticket)
      expect(result[:model]).to be_instance_of(Tickets::Decorators::Show)
      expect(result).to be_success
    end
  end

  context 'failure' do
    context 'when ticket does not exist' do
      let(:ticket) { build_stubbed(:ticket) }

      it 'fails' do
        expect(result[:model]).to eq(nil)
        expect(result).to be_failure
      end
    end
  end
end

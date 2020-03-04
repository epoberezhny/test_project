RSpec.describe Tickets::Operations::Index do
  subject(:result) { described_class.call(params: params) }

  let(:params) { { page: page, items: items } }
  let(:page) { 2 }
  let(:items) { 2 }

  context 'success' do
    let!(:tickets) { create_list(:ticket, page * items + 1) }

    it 'returns paginated list of tickets' do
      expect(result[:model]).to eq(tickets.slice(items * (page - 1), items))
      expect(result).to be_success
    end
  end
end

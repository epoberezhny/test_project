RSpec.describe 'Tickets index' do
  subject(:index_page) { Pages::Tickets::IndexPage.new }

  let(:page) { 2 }
  let(:items) { 2 }

  let!(:tickets) { create_list(:ticket, page * items) }

  before { index_page.load(page: page, items: items) }

  describe 'tickets table' do
    it 'displays table' do
      displayed_tickets = tickets.slice(items * (page - 1), items)
      expected_rows = displayed_tickets.map do |ticket|
        ticket.attributes.symbolize_keys.slice(
          :request_number,
          :sequence_number,
          :request_type
        ).merge(
          id: ticket.id.to_s,
          response_due_date_time: ticket.response_due_date_time.strftime('%a, %d %b %Y %H:%M:%S %z'),
          created_at: ticket.created_at.strftime('%a, %d %b %Y %H:%M:%S %z'),
          actions: I18n.t('tickets.ticket.show')
        )
      end

      expect(index_page).to be_displayed
      expect(index_page.tickets.rows).to eq(expected_rows)
      displayed_tickets.each do |ticket|
        expect(index_page).to have_link(href: ticket_path(ticket))
      end
    end
  end
end

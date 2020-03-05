RSpec.describe 'Tickets show' do
  subject(:show_page) { Pages::Tickets::ShowPage.new }

  let(:ticket) { create(:ticket) }
  let!(:excavator) { create(:excavator, ticket: ticket) }

  before { show_page.load(id: ticket.id) }

  describe 'ticket info' do
    context 'when ticket exists' do

      it 'displays ticket info' do
        expect(show_page).to be_displayed
        expect(show_page.fields.map(&:text)).to eq([
          ticket.id.to_s,
          ticket.request_number,
          ticket.sequence_number,
          ticket.request_type,
          ticket.response_due_date_time.strftime('%a, %d %b %Y %H:%M:%S %z'),
          ticket.primary_service_area_code,
          ticket.additional_service_area_codes.to_sentence,
          ticket.created_at.strftime('%a, %d %b %Y %H:%M:%S %z'),
          excavator.company_name,
          excavator.full_address,
          excavator.crew_onsite.to_s,
          excavator.created_at.strftime('%a, %d %b %Y %H:%M:%S %z')
        ])
      end
    end

    context 'when ticket does not exist' do
      let(:ticket) { build_stubbed(:ticket) }
      let!(:excavator) { build_stubbed(:excavator, ticket: ticket) }

      it 'renders index' do
        expect(show_page).to have_current_path('/tickets')
      end
    end
  end
end

RSpec.describe Tickets::Contracts::Create, type: :model do
  subject(:contract) { described_class.new(build_stubbed(:ticket)) }

  describe 'validations' do
    describe 'request_number' do
      it { is_expected.to validate_presence_of(:request_number) }
      it { is_expected.to allow_value('123456').for(:request_number) }
      it { is_expected.to allow_value('123-456').for(:request_number) }
      it { is_expected.to allow_value('1' * 50).for(:request_number) }
      it { is_expected.not_to allow_value('123-a56').for(:request_number) }
      it { is_expected.not_to allow_value('1' * 51).for(:request_number) }

      describe 'uniqueness' do
        let(:ticket) { create(:ticket) }

        it { is_expected.not_to allow_value(ticket.request_number).for(:request_number).with_message(:taken) }
      end
    end

    describe 'sequence_number' do
      it { is_expected.to validate_presence_of(:sequence_number) }
      it { is_expected.to allow_value('123456').for(:sequence_number) }
      it { is_expected.to allow_value('1' * 50).for(:sequence_number) }
      it { is_expected.not_to allow_value('123-23').for(:sequence_number) }
      it { is_expected.not_to allow_value('123a3').for(:sequence_number) }
      it { is_expected.not_to allow_value('1' * 51).for(:sequence_number) }
    end

    describe 'request_type' do
      it { is_expected.to validate_presence_of(:request_type) }
      it { is_expected.to validate_length_of(:request_type).is_at_most(50) }
    end

    describe 'response_due_date_time' do
      it { is_expected.to validate_presence_of(:response_due_date_time) }
      it do
        is_expected.not_to allow_value('date')
          .for(:response_due_date_time).with_message(:invalid_datetime)
      end
    end

    describe 'primary_service_area_code' do
      it { is_expected.to validate_presence_of(:primary_service_area_code) }
      it { is_expected.to validate_length_of(:primary_service_area_code).is_at_most(50) }
      it { is_expected.to allow_value('abc456').for(:primary_service_area_code) }
      it { is_expected.not_to allow_value('abc4,56').for(:primary_service_area_code) }
    end

    describe 'additional_service_area_codes' do
      it { is_expected.to validate_presence_of(:additional_service_area_codes) }
      it { is_expected.to allow_value(['aaa', '123', 'a1b2']).for(:additional_service_area_codes) }
      it { is_expected.not_to allow_value(['aaa', '12,3']).for(:additional_service_area_codes) }
    end

    describe 'well_known_text' do
      it { is_expected.to validate_presence_of(:well_known_text) }
      it { is_expected.to allow_value('polygon((12 34, 56 78, 9 10, 12 34))').for(:well_known_text) }
      it { is_expected.not_to allow_value('polygon((12 34, 56 78, 12 34))').for(:well_known_text) }
      it { is_expected.not_to allow_value('polygon(12 34, 56 78)').for(:well_known_text) }
      it { is_expected.not_to allow_value('point(12 34)').for(:well_known_text) }
    end
  end
end

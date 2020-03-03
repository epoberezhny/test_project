RSpec.describe Tickets::Excavators::Contracts::Create, type: :model do
  subject(:contract) { described_class.new(build_stubbed(:excavator)) }

  describe 'validations' do
    describe 'company_name' do
      it { is_expected.to validate_presence_of(:company_name) }
      it { is_expected.to validate_length_of(:company_name).is_at_most(50) }
    end

    describe 'full_address' do
      it { is_expected.to validate_presence_of(:full_address) }
      it { is_expected.to validate_length_of(:full_address).is_at_most(100) }
    end
  end
end

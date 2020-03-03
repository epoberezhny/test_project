RSpec.describe Ticket do
  subject(:ticket) { build(:ticket) }

  it 'has valid factory' do
    is_expected.to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_one(:excavator) }
  end
end

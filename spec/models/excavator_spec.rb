RSpec.describe Excavator do
  subject(:excavator) { build(:excavator) }

  it 'has valid factory' do
    is_expected.to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:ticket) }
  end
end

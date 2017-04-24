require 'rails_helper'

RSpec.describe Universe, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:heroes) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end

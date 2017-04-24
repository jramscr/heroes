require 'rails_helper'

RSpec.describe Hero, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:hero_abilities) }
    it { is_expected.to have_many(:abilities).through(:hero_abilities) }
    it { is_expected.to belong_to(:universe) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:real_name) }
    it { is_expected.to validate_presence_of(:species) }
  end
end

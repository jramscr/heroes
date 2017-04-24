require 'rails_helper'

RSpec.describe HeroAbility, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:ability) }
    it { is_expected.to belong_to(:hero) }
  end
end

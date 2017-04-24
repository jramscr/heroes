class HeroAbility < ApplicationRecord
  belongs_to :ability
  belongs_to :hero
end

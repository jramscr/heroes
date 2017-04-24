class Hero < ApplicationRecord
  has_many :hero_abilities
  has_many :abilities, through: :hero_abilities
  belongs_to :universe

  validates :name, :real_name, :species, presence: true
end

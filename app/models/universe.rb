class Universe < ApplicationRecord
  has_many :heroes, dependent: :destroy

  validates :name, presence: true
end

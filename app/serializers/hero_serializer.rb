class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :real_name, :species, :created_at, :updated_at
  has_many :abilities
  belongs_to :universe
end

class CreateHeroAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_abilities do |t|
      t.references :hero, null: false, index: true
      t.references :ability, null: false, index: true

      t.timestamps
    end
  end
end

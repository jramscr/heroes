class CreateHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :name, null: false
      t.string :real_name, null: false
      t.string :species, null: false
      t.references :universe, null: false, index: true

      t.timestamps
    end
  end
end

class CreateKlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :klasses do |t|
      t.string  :name,                 null: false, default: ''
      t.integer :hit_die,              null: false, default: 6
      t.integer :saving_thows,         null: false, default: [], array: true
      t.integer :spellcasting_level,   null: true
      t.integer :spellcasting_ability, null: true
      t.json    :prerequisites,        null: false, default: {}

      t.timestamps
    end
  end
end

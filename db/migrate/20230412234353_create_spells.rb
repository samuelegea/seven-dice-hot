class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string  :name,                null: false
      t.text    :desc,                null: false
      t.integer :school,              null: false
      t.integer :components,          null: false, array: true, default: []
      t.string  :material,            null: false
      t.boolean :ritual,              null: false, default: false
      t.integer :duration_number,     null: false, default: 0
      t.integer :duration_unit,       null: false, default: 0
      t.integer :duration_delimiter,  null: true
      t.boolean :concentration,       null: false, default: false
      t.integer :casting_time_unit,   null: false, default: 0
      t.integer :casting_time_number, null: false, default: 0
      t.integer :level,               null: false, default: 0
      t.boolean :attack_type_melee,   null: true, default: false
      t.integer :saving_throw,        null: true, default: 0
      t.integer :dc_success,          null: true
      t.string  :dc_desc,             null: true
      t.integer :aoe_type,            null: true
      t.integer :aoe_size,            null: true

      t.timestamps
    end
  end
end

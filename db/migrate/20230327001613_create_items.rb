class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name     , null: false
      t.text :desc       , null: false
      t.integer :category, null: false
      t.integer :weapon_category
      t.integer :weapon_range
      t.integer :cost_cp, null: false
      t.string :damage
      t.integer :damage_type
      t.integer :range_normal
      t.integer :range_long
      t.integer :weight
      t.integer :properties, array: true, default: []
      t.integer :throw_range_normal
      t.integer :throw_range_long
      t.integer :two_handed_damage
      t.integer :two_handed_damage_type
      t.json :custom
      t.integer :armor_category
      t.integer :armor_class
      t.boolean :ac_dex_bonus
      t.integer :max_bonus
      t.integer :str_minimum
      t.boolean :stealth_disadvantage
      t.integer :gear_category
      t.integer :tool_category
      t.integer :vehicle_category
      t.integer :speed_unit
      t.integer :speed
      t.integer :capacity

      t.timestamps
    end
  end
end

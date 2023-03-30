class CreateWeaponProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_properties do |t|
      t.string :name,     null: false, default: ''
      t.text :desc,       null: false, default: ''
      t.json :properties, null: false, default: {}

      t.timestamps
    end
  end
end

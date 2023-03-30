class CreateWeaponPropertiesItems < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_properties_items do |t|
      t.references :weapon_property, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end

    remove_column :items, :properties
  end
end

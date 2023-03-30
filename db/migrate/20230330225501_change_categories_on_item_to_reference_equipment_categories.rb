class ChangeCategoriesOnItemToReferenceEquipmentCategories < ActiveRecord::Migration[7.0]
  def change
    change_table :items do |t|
      t.remove :category
      t.remove :vehicle_category
      t.remove :tool_category
      t.remove :weapon_category
      t.remove :weapon_range
      t.remove :armor_category
      t.remove :gear_category
    end
  end
end

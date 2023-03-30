class CreateEquipmentCategoryMagicItem < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_category_magic_items do |t|
      t.references :magic_item, null: false, foreign_key: true
      t.references :equipment_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

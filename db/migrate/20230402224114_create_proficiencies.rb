class CreateProficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiencies do |t|
      t.references :source, null: false, polymorphic: true
      t.references :skill, null: true, foreign_key: true
      t.references :item, null: true, foreign_key: true
      t.references :magic_items, null: true, foreign_key: true
      t.references :equipment_category, null: true, foreign_key: true

      t.timestamps
    end
  end
end

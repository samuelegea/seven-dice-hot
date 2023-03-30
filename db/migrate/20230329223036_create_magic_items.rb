class CreateMagicItems < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_items do |t|
      t.string     :name, null: false
      t.text       :desc, null: false
      t.integer    :category, null: false
      t.integer    :rarity, null: false
      t.boolean    :variant, null: false, default: false
      t.references :variant_of, null: true, foreign_key: { to_table: :magic_items }
      t.json       :properties, null: false, default: {}

      t.timestamps
    end
  end
end

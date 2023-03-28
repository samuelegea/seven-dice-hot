class ChangeTypeColumnNameOnLanguagesToRarity < ActiveRecord::Migration[7.0]
  def change
    rename_column :languages, :type, :rarity
    change_column :languages, :rarity, :integer, default: 1, null: false
    change_column :languages, :name, :string, null: false
    add_column :languages, :script, :integer, null: false
  end
end

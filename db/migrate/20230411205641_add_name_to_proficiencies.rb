class AddNameToProficiencies < ActiveRecord::Migration[7.0]
  def change
    add_column :proficiencies, :name, :string
    add_column :proficiencies, :ability_score, :integer
    remove_column :proficiencies, :magic_items_id
    remove_column :proficiencies, :source_type
    remove_column :proficiencies, :source_id
  end
end

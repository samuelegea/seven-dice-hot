class ChangeTwoHandedDamageToString < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :two_handed_damage, :string
    remove_column :items, :two_handed_damage_type
    add_column :items, :two_handed_damage_type, :integer
  end
end

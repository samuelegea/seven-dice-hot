class ChangeTwoHandedDamageTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :two_handed_damage_type, :string
  end
end

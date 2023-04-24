class ChangeClassHitDieToString < ActiveRecord::Migration[7.0]
  def change
    change_column :klasses, :hit_die, :string, null: false, default: '1d6'
  end
end

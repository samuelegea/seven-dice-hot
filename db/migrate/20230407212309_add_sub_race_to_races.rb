class AddSubRaceToRaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :races, :parent, null: true, foreign_key: { to_table: :races }
  end
end

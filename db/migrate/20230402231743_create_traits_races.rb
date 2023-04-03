class CreateTraitsRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :traits_races do |t|
      t.references :trait, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLanguageRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :language_races do |t|
      t.references :language, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end

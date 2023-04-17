class CreateKlassSpellsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :klass_spells do |t|
      t.references :klass, null: false, foreign_key: true
      t.references :spell, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProficiencySources < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiency_sources do |t|
      t.references :proficiency, null: false, foreign_key: true
      t.references :source, null: false, polymorphic: true

      t.timestamps
    end
  end
end

class CreateProficiencyOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiency_options do |t|
      t.references :source, null: false, polymorphic: true
      t.integer :quantity

      t.timestamps
    end
  end
end

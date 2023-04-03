class ProficiencyOptionsProficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiency_options_proficiency do |t|
      t.references :proficiency_option, null: false, foreign_key: true
      t.references :proficiency, null: false, foreign_key: true

      t.timestamps
    end

  end
end

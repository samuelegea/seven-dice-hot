class DropProficiencyOptions < ActiveRecord::Migration[7.0]
  def change
    drop_table :proficiency_option_sources, if_exists: true, force: :cascade
    drop_table :proficiency_options, if_exists: true, force: :cascade
  end
end

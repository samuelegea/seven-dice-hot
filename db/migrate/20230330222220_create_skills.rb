class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name,           null: false, default: ''
      t.text :desc,             null: false, default: ''
      t.integer :ability_score, null: false, default: 0

      t.timestamps
    end
  end
end

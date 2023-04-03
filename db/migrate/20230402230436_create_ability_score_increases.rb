class CreateAbilityScoreIncreases < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_score_increases do |t|
      t.references :source, null: false, polymorphic: true
      t.integer :ability, null: false
      t.integer :bonus, null: false

      t.timestamps
    end
  end
end

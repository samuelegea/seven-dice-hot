class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :optionable, polymorphic: true, null: false
      t.references :option_source, null: false, foreign_key: true

      t.timestamps
    end
  end
end

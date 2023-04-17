class CreateOptionSources < ActiveRecord::Migration[7.0]
  def change
    create_table :option_sources do |t|
      t.references :source,   polymorphic: true, null: false
      t.integer    :quantity, null: false

      t.timestamps
    end
  end
end

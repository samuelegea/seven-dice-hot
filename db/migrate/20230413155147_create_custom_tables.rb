class CreateCustomTables < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_tables do |t|
      t.references :source,      null: false, polymorphic: true
      t.string     :column_name, null: false
      t.string     :cell_value,  null: false
      t.integer    :cell_type,   null: false
      t.integer    :row_number,  null: false

      t.timestamps
    end
  end
end

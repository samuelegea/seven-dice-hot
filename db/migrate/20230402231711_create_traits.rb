class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string :name, null: false, default: ''
      t.text :desc, null: false, default: ''
      t.json :properties, default: {}, null: false

      t.timestamps
    end
  end
end

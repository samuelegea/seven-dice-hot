class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string     :name, null: false, default: ''
      t.text       :desc, null: false, default: ''
      t.integer    :level, null: false, default: 0
      t.references :klass, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: { to_table: :features }

      t.timestamps
    end
  end
end

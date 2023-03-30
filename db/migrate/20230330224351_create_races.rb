class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :desc
      t.integer :speed
      t.integer :size

      t.timestamps
    end
  end
end

class CreateStartingEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :starting_equipments do |t|
      t.references :klass
      t.references :item
      t.timestamps
    end
  end
end

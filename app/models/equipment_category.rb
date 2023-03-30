class EquipmentCategory < ApplicationRecord
  has_and_belongs_to_many :items, join_table: "equipment_categories_items"
  has_and_belongs_to_many :magic_items, join_table: "equipment_category_magic_items"
end

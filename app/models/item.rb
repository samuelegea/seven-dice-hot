class Item < ApplicationRecord
  include DamageTypes
  enum :two_handed_damage_type, self.damage_types, prefix: :two_handed, scopes: false

  has_and_belongs_to_many :weapon_properties, join_table: "weapon_properties_items"
  has_and_belongs_to_many :equipment_categories, join_table: "equipment_categories_items"
end

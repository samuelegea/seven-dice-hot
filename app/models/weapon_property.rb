class WeaponProperty < ApplicationRecord
  has_and_belongs_to_many :items, join_table: :weapon_properties_items
end

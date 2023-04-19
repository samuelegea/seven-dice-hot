class Item < ApplicationRecord
  include DamageTypes
  attribute :damage, :dice_type
  enum :two_handed_damage_type, damage_types, prefix: :two_handed, scopes: false

  has_and_belongs_to_many :weapon_properties, join_table: 'weapon_properties_items'
  has_and_belongs_to_many :equipment_categories, join_table: 'equipment_categories_items'
  has_and_belongs_to_many :starting_equipment_klasses, join_table: :starting_equipments, class_name: 'Klass', foreign_key: 'equipment_id', association_foreign_key: 'klass_id'
end

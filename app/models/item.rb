class Item < ApplicationRecord
  include DamageTypes

  enum category: [
    'weapon',
    'armor',
    'adventuring gear',
    'tools',
    'mounts and vehicles'
  ]

  enum armor_category: [
    'light',
    'medium',
    'heavy',
    'shield'
  ]

  enum tool_category: [
    "artisan's tools",
    'gaming sets',
    'musical instrument',
    'other tools'
  ]

  enum vehicle_category: [
    'mounts and other animals',
    'tack, harness, and drawn vehicles',
    'land vehicles',
    'waterborne vehicles'
  ]

  enum gear_category: [
    'standard gear',
    'kits',
    'equipment packs',
    'arcane foci',
    'druidic foci',
    'holy symbols',
    'wondrous items',
    'ammunition',
  ]

  # Missing equipment_category from enum  because there weren't any => 'rod', 'potion', 'ring', 'scroll', 'staff', 'wand'
  enum weapon_category: ['simple', 'martial']
  enum weapon_range: ['melee', 'ranged']
  enum :two_handed_damage_type, self.damage_types, prefix: :two_handed, scopes: false

  has_and_belongs_to_many :weapon_properties, join_table: "weapon_properties_items"
end

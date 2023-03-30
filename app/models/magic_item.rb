class MagicItem < ApplicationRecord
  belongs_to :variant_of, class_name: 'MagicItem', optional: true, inverse_of: :variants, foreign_key: :variant_of_id
  has_many :variants, class_name: 'MagicItem', foreign_key: :variant_of_id, inverse_of: :variant_of

  enum :rarity, ['common', 'uncommon', 'rare', 'very rare', 'legendary', 'artifact', 'varies']
  enum :category, [
    'weapon',
    'armor',
    'adventuring gear',
    'ammunition',
    'tools',
    'mounts and vehicles',
    'simple weapons',
    'martial weapons',
    'melee weapons',
    'ranged weapons',
    'simple melee weapons',
    'simple ranged weapons',
    'martial melee weapons',
    'martial ranged weapons',
    'light armor',
    'medium armor',
    'heavy armor',
    'shields',
    'standard gear',
    'kits',
    'equipment packs',
    'artisan\'s tools',
    'gaming sets',
    'musical instruments',
    'other tools',
    'mounts and other animals',
    'tack, harness, and drawn vehicles',
    'land vehicles',
    'waterborne vehicles',
    'arcane foci',
    'druidic foci',
    'holy symbols',
    'wondrous items',
    'rod',
    'potion',
    'ring',
    'scroll',
    'staff',
    'wand'
  ]
end

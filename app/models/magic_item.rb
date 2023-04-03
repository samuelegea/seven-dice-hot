class MagicItem < ApplicationRecord
  belongs_to :variant_of, class_name: 'MagicItem', optional: true, inverse_of: :variants, foreign_key: :variant_of_id
  has_many :variants, class_name: 'MagicItem', foreign_key: :variant_of_id, inverse_of: :variant_of
  has_and_belongs_to_many :equipment_categories, join_table: "equipment_category_magic_items"
  has_many :proficiencies

  enum :rarity, ['common', 'uncommon', 'rare', 'very rare', 'legendary', 'artifact', 'varies']
end

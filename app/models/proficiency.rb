class Proficiency < ApplicationRecord
  belongs_to :source, polymorphic: true

  belongs_to :skill, class_name: 'Skill', optional: true
  belongs_to :item, class_name: 'Item', optional: true
  belongs_to :magic_items, class_name: 'MagicItem', optional: true
  belongs_to :equipment_category, class_name: 'EquipmentCategory', optional: true
  has_and_belongs_to_many :proficiency_options, join_table: :proficiency_options_proficiency
end

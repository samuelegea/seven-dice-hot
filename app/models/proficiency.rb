class Proficiency < ApplicationRecord
  include AbilityScores

  belongs_to :skill,               class_name: 'Skill', optional: true
  belongs_to :item,                class_name: 'Item', optional: true
  belongs_to :equipment_category,  class_name: 'EquipmentCategory', optional: true
  has_many   :proficiency_sources, dependent:  :destroy
  has_many   :sources,             through:    :proficiency_sources
  has_many   :options,             dependent:  :destroy
end

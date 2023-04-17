class Proficiency < ApplicationRecord
  include AbilityScores

  belongs_to              :skill,               class_name: 'Skill', optional: true
  belongs_to              :item,                class_name: 'Item', optional: true
  belongs_to              :equipment_category,  class_name: 'EquipmentCategory', optional: true
  has_and_belongs_to_many :proficiency_options, join_table: :proficiency_options_proficiency
  has_many                :proficiency_sources, dependent:  :destroy
  has_many                :sources,             through:    :proficiency_sources
end

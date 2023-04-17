class Klass < ApplicationRecord
  include AbilityScores

  has_many :proficiency_sources, as: :source
  has_many :proficiencies, through: :proficiency_sources
  has_many :option_sources, as: :source, dependent: :destroy
  has_many :options, through: :option_sources
  has_many :proficiencies_options, through: :options, source: :optionable, source_type: 'Proficiency', foreign_key: 'optionable_id'
  has_many :equipment_options, through: :options, source: :optionable, source_type: 'Proficiency', foreign_key: 'optionable_id'

  has_and_belongs_to_many :spells, join_table: :klass_spells
  has_and_belongs_to_many :proficient_skill, through: :proficiencies, source: :skill
  has_and_belongs_to_many :proficient_item, through: :proficiencies, source: :item
  has_and_belongs_to_many :proficient_equipment_category, through: :proficiencies, source: :equipment_category
  has_and_belongs_to_many :starting_equipments, join_table: :starting_equipments, class_name: 'Item', foreign_key: 'klass_id', association_foreign_key: 'item_id'

  class << self
    alias saving_throws ability_scores
  end

  def saving_throws=(values)
    self[:saving_throws] = values.map do |value|
      match_component(value.to_s)
    end
  end

  def saving_throws
    self[:saving_throws]&.map { |value| Klass.saving_throws.key(value) }
  end

  Spell.saving_throws.each_key do |component|
    define_method("#{component.downcase}?") do
      saving_throws&.include?(component)
    end
  end
end

class Race < ApplicationRecord
  include Sizes

  has_and_belongs_to_many :languages, join_table: :language_races
  has_many :traits_races, dependent: :destroy
  has_many :traits, through: :traits_races
  has_many :ability_score_increases, as: :source, dependent: :destroy
  has_many :proficiency_sources, as: :source, dependent: :destroy
  has_many :proficiencies, through: :proficiency_sources
  has_many :option_sources, as: :source, dependent: :destroy
  has_many :options, through: :option_sources
  has_many :proficiencies, through: :options, source: :optionable, source_type: 'Proficiency', foreign_key: 'optionable_id'
end

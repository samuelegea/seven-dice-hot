class Race < ApplicationRecord
  include Sizes

  has_and_belongs_to_many :languages, join_table: :language_races
  has_many :traits_races, dependent: :destroy
  has_many :traits, through: :traits_races
  has_many :ability_score_increases, as: :source, dependent: :destroy
  has_many :proficiency_sources, as: :source, dependent: :destroy
  has_many :proficiencies, through: :proficiency_sources
  has_many :proficiency_option_sources, as: :source
  has_many :proficiency_options, through: :proficiency_option_sources
end

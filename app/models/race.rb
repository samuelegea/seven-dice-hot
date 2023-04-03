class Race < ApplicationRecord
  include Sizes

  has_and_belongs_to_many :languages, join_table: :language_races
  has_many :traits_races, dependent: :destroy
  has_many :traits, through: :traits_races
  has_many :ability_score_increases, as: :source, dependent: :destroy
  has_many :proficiencies, as: :source, dependent: :destroy
  has_many :proficiency_options, as: :source
  has_many :proficiencies_opted, through: :proficiency_options, source: :proficiencies, dependent: :destroy
end
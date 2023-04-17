class Trait < ApplicationRecord
  has_many :proficiency_sources,        as:      :source
  has_many :proficiency_option_sources, as:      :source
  has_many :proficiencies,              through: :proficiency_sources
  has_many :proficiency_options,        through: :proficiency_option_sources
end

class ProficiencyOption < ApplicationRecord
  has_and_belongs_to_many :proficiencies, join_table: :proficiency_options_proficiency
  has_many :proficiency_option_sources, dependent: :destroy
end

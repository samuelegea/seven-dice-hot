class ProficiencyOption < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_and_belongs_to_many :proficiencies, join_table: :proficiency_options_proficiency

end

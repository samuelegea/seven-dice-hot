class ProficiencyOptionSource < ApplicationRecord
  belongs_to :proficiency_option
  belongs_to :source, polymorphic: true
end

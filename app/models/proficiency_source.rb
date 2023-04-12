class ProficiencySource < ApplicationRecord
  belongs_to :proficiency
  belongs_to :source, polymorphic: true
end

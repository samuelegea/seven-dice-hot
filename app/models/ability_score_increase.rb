class AbilityScoreIncrease < ApplicationRecord
  include AbilityScores
  belongs_to :source, polymorphic: true
end

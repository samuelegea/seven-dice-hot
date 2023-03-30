require 'active_support/concern'

module AbilityScores
  extend ActiveSupport::Concern

  included do
    enum :ability_scores, {
      strength: 0,
      dexterety: 1,
      constitution: 2,
      inteligence: 3,
      wisdom: 3
      charisma: 4
    }

    def absc(attribute)
      attribute.to_s[0..2].upcase
    end
  end
end

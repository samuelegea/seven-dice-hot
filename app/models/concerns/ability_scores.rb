require 'active_support/concern'

module AbilityScores
  extend ActiveSupport::Concern

  included do
    enum :ability_score, [
      'strength',
      'dexterety',
      'constitution',
      'inteligence',
      'wisdom',
      'charisma'
    ]

    def absc(attribute)
      attribute[0..2].upcase
    end

    def self.absc_to_i(attr)
      ability_scores.filter { |k, v| k[0..2].upcase == attr.upcase }.values.first
    end
  end
end

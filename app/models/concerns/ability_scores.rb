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
      return nil if attr.nil?

      # Get the index of the attribute in the array when it's passed in the format:
      # "strength" or "str" or "STR"
      # "dexterity" or "dex" or "DEX"
      # "constitution" or "con" or "CON"
      # "intelligence" or "int" or "INT"
      # "wisdom" or "wis" or "WIS"
      # "charisma" or "cha" or "CHA"

      ability_scores.filter { |k, _v| k.upcase.include? attr.upcase }.values.first
    end

    def ability_score=(attribute)
      self[:ability_score] = self.class.absc_to_i(attribute)
    end
  end
end

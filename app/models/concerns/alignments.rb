require 'active_support/concern'

module Alignments
  extend ActiveSupport::Concern

  included do
    enum alignment: %i[
      chaotic_good
      lawful_good
      neutral_good

      chaotic_neutral
      lawful_neutral
      neutral

      chaotic_evil
      lawful_evil
      neutral_evil
    ]
  end
end

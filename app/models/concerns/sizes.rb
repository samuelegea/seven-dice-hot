require 'active_support/concern'

module Sizes
  extend ActiveSupport::Concern

  included do
    enum size: {
     'tiny' => 0,
     'small' => 1,
     'medium' => 2,
     'large' => 3,
     'huge' => 4,
     'gargantuan' => 5,
    }

    def space
      sz = self.class.sizes[size]

      return 2.5 if sz.zero?
      
      5 * sz
    end
  end
end

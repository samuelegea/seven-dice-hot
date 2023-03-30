class Race < ApplicationRecord
  include Sizes

  has_and_belongs_to_many :languages
end

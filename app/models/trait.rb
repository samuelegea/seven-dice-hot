class Trait < ApplicationRecord
  has_many :proficiencies, as: :source
  has_many :proficiency_options, as: :source
end

class OptionSource < ApplicationRecord
  belongs_to :source, polymorphic: true
  has_many :options, dependent: :destroy
end

class CustomTable < ApplicationRecord
  belongs_to :source, polymorphic: true
end

class Feature < ApplicationRecord
  belongs_to :klass
  belongs_to :parent
end

class Option < ApplicationRecord
  belongs_to :optionable, polymorphic: true
  belongs_to :option_source, class_name: 'OptionSource', foreign_key: 'option_source_id'
end

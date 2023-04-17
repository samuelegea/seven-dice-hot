require 'active_support/concern'

module Times
  extend ActiveSupport::Concern

  included do
    enum time: [
      :action,
      :reaction,
      :bonus_action,
      :round,
      :minute,
      :hour,
      :day,
      :week,
      :month,
      :year
    ]
  end
end

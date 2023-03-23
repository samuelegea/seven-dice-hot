require 'active_support/concern'

module DamageTypes
  extend ActiveSupport::Concern

  included do
    enum damage_type: %i[
      acid
      bludgeoning
      cold
      fire
      force
      lightning
      necrotic
      piercing
      poison 
      psychic
      radiant
      slashing
      thunder
    ]
  end
end

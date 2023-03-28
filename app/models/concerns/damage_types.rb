require 'active_support/concern'

module DamageTypes
  extend ActiveSupport::Concern

  included do
    enum :damage_type, %w[
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
    ], instance_methods: false, scopes: false # instance_methods: false does not currently work, but it will in the future
  end
end

class Spell < ApplicationRecord
  include AbilityScores
  include Times
  COMPONENTS = { 'V' => 'verbal', 'S' => 'somatic', 'M' => 'material' }.freeze

  enum school: [
    :abjuration, :conjuration, :divination, :enchantment,
    :evocation, :illusion, :necromancy, :transmutation
  ]
  enum duration_delimiter: [:exact, :up_to, :until_dispelled, :special, :instantaneous], _prefix: :duration
  enum aoe_type: [:cone, :cube, :cylinder, :line, :sphere], _prefix: :aoe
  enum dc_success: [:half, :none, :other], _prefix: :dc
  enum component: [:material, :somatic, :verbal]
  enum duration_unit: times, _prefix: :duration
  enum casting_time_unit: times, _prefix: :casting_time
  enum saving_throw: ability_scores, _prefix: :st

  alias st absc

  def self.st_to_i(args)
    absc_to_i(args)
  end

  def duration
    return duration_delimiter.humanize unless duration_exact? || duration_up_to?

    "#{duration_up_to? ? 'Up to ' : ''}#{duration_number} #{duration_unit.pluralize(duration_number)}"
  end

  def casting_time
    "#{casting_time_number} #{casting_time_unit.pluralize(casting_time_number)}"
  end

  def components=(values)
    self[:components] = values.map do |value|
      match_component(value.to_s)
    end
  end

  def components
    self[:components]&.map { |value| Spell.components.key(value) }
  end

  def match_component(component)
    num_component = Spell.components[component] if Spell.components.keys.include?(component)
    num_component = Spell.components[Spell::COMPONENTS[component]] if Spell::COMPONENTS.keys.include?(component)

    return num_component if Spell.components.key(num_component || component)

    raise ArgumentError, "'#{component}' is not a valid component"
  end

  Spell.components.each_key do |component|
    define_method("#{component.downcase}?") do
      components&.include?(component)
    end
  end

  def cantrip?
    level.zero?
  end
end

class Spell < ApplicationRecord
  include AbilityScores
  include Times

  enum aoe_type: [:cone, :cube, :cylinder, :line, :sphere], _prefix: :aoe

  enum school: {
    abjuration: 0,
    conjuration: 1,
    divination: 2,
    enchantment: 3,
    evocation: 4,
    illusion: 5,
    necromancy: 6,
    transmutation: 7
  }

  enum dc_success: {
    half: 0,
    none: 1,
    other: 2
  }, _prefix: :dc

  enum saving_throw: ability_scores, _prefix: :st

  enum component: [
    :material,
    :somatic,
    :verbal
  ]

  COMPONENTS = { 'V' => 'verbal', 'S' => 'somatic', 'M' => 'material' }.freeze

  enum duration_unit: times, _prefix: :duration

  enum duration_delimiter: [:exact, :up_to, :until_dispelled, :special, :instantaneous], _prefix: :duration

  enum casting_time_unit: times, _prefix: :casting_time

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

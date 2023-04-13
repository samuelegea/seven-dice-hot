class Spell < ApplicationRecord
  extend ArrayEnum
  include AbilityScores

  enum aoe_type: {
    cone: 0,
    cube: 1,
    cylinder: 2,
    line: 3,
    sphere: 4
  }

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
  }, prefix: :dc

  enum saving_throw: ability_scores, prefix: :st

  array_enum component: {
    material: 0,
    somatic: 1,
    verbal: 2
  }

  enum duration_unit: {
    action: 0,
    minute: 1,
    hour: 2,
    day: 3,
    instant: 4,
    until_dispelled: 5
  }, prefix: :duration

  enum casting_time_unit: {
    action: 0,
    bonus_action: 1,
    reaction: 2,
    minute: 3,
    hour: 4,
    day: 5,
    week: 6,
    month: 7,
    year: 8
  }, prefix: :casting_time

  # TODO: Add ability score aliases for saving throws
end

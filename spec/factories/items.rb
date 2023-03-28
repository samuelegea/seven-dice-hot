FactoryBot.define do
  factory :item do
    name { "MyString" }
    desc { "MyText" }
    category { 1 }
    weapon_category { 1 }
    weapon_range { 1 }
    cost_cp { 1 }
    damage { "MyString" }
    damage_type { 1 }
    range_normal { 1 }
    range_long { 1 }
    weight { 1 }
    properties { 1 }
    throw_range_normal { 1 }
    throw_range_long { 1 }
    two_handed_damage { 1 }
    two_handed_damage_type { 1 }
    custom { "" }
    armor_category { 1 }
    armor_class { 1 }
    ac_dex_bonus { false }
    max_bonus { 1 }
    str_minimum { 1 }
    stealth_disadvantage { false }
    gear_category { 1 }
    tool_category { 1 }
    vehicle_category { 1 }
    speed_unit { 1 }
    speed { 1 }
    capacity { 1 }
  end
end

FactoryBot.define do
  factory :spell do
    name { "MyString" }
    desc { "MyText" }
    school { 1 }
    components { 1 }
    material { "MyString" }
    ritual { false }
    duration_number { 1 }
    duration_unit { 1 }
    duration_delimiter { 1 }
    concentration { false }
    casting_time_unitt { 1 }
    casting_time_number { 1 }
    level { 1 }
    attack_type_melee { false }
    saving_throw { 1 }
    dc_success { 1 }
    dc_desc { "MyString" }
    aoe_type { 1 }
    aoe_size { 1 }
  end
end

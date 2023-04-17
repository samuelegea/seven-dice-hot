FactoryBot.define do
  factory :klass do
    name { "MyString" }
    hit_die { 1 }
    spellcasting_level { 1 }
    spellcasting_ability { 1 }
    prerequisites { "" }
  end
end

FactoryBot.define do
  factory :magic_item do
    name { "MyString" }
    category { 1 }
    rarity { 1 }
    variant { false }
    variant_of { nil }
    desc { "MyText" }
    properties { "" }
  end
end

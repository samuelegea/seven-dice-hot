FactoryBot.define do
  factory :feature do
    name { "MyString" }
    desc { "MyText" }
    level { 1 }
    klass { nil }
    parent { nil }
  end
end

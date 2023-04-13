FactoryBot.define do
  factory :custom_table do
    source { nil }
    column_name { "MyString" }
    cell_value { "MyString" }
    cell_type { 1 }
    row_number { 1 }
  end
end

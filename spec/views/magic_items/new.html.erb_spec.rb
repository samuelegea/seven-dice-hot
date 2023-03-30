require 'rails_helper'

RSpec.describe "magic_items/new", type: :view do
  before(:each) do
    assign(:magic_item, MagicItem.new(
      name: "MyString",
      category: 1,
      rarity: 1,
      variant: false,
      variant_of: nil,
      desc: "MyText",
      properties: ""
    ))
  end

  it "renders new magic_item form" do
    render

    assert_select "form[action=?][method=?]", magic_items_path, "post" do

      assert_select "input[name=?]", "magic_item[name]"

      assert_select "input[name=?]", "magic_item[category]"

      assert_select "input[name=?]", "magic_item[rarity]"

      assert_select "input[name=?]", "magic_item[variant]"

      assert_select "input[name=?]", "magic_item[variant_of_id]"

      assert_select "textarea[name=?]", "magic_item[desc]"

      assert_select "input[name=?]", "magic_item[properties]"
    end
  end
end

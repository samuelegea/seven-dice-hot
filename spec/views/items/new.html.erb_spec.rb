require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      name: "MyString",
      desc: "MyText",
      category: 1,
      weapon_category: 1,
      weapon_range: 1,
      cost_cp: 1,
      damage: "MyString",
      damage_type: 1,
      range_normal: 1,
      range_long: 1,
      weight: 1,
      properties: 1,
      throw_range_normal: 1,
      throw_range_long: 1,
      two_handed_damage: 1,
      two_handed_damage_type: 1,
      custom: "",
      armor_category: 1,
      armor_class: 1,
      ac_dex_bonus: false,
      max_bonus: 1,
      str_minimum: 1,
      stealth_disadvantage: false,
      gear_category: 1,
      tool_category: 1,
      vehicle_category: 1,
      speed_unit: 1,
      speed: 1,
      capacity: 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[desc]"

      assert_select "input[name=?]", "item[category]"

      assert_select "input[name=?]", "item[weapon_category]"

      assert_select "input[name=?]", "item[weapon_range]"

      assert_select "input[name=?]", "item[cost_cp]"

      assert_select "input[name=?]", "item[damage]"

      assert_select "input[name=?]", "item[damage_type]"

      assert_select "input[name=?]", "item[range_normal]"

      assert_select "input[name=?]", "item[range_long]"

      assert_select "input[name=?]", "item[weight]"

      assert_select "input[name=?]", "item[properties]"

      assert_select "input[name=?]", "item[throw_range_normal]"

      assert_select "input[name=?]", "item[throw_range_long]"

      assert_select "input[name=?]", "item[two_handed_damage]"

      assert_select "input[name=?]", "item[two_handed_damage_type]"

      assert_select "input[name=?]", "item[custom]"

      assert_select "input[name=?]", "item[armor_category]"

      assert_select "input[name=?]", "item[armor_class]"

      assert_select "input[name=?]", "item[ac_dex_bonus]"

      assert_select "input[name=?]", "item[max_bonus]"

      assert_select "input[name=?]", "item[str_minimum]"

      assert_select "input[name=?]", "item[stealth_disadvantage]"

      assert_select "input[name=?]", "item[gear_category]"

      assert_select "input[name=?]", "item[tool_category]"

      assert_select "input[name=?]", "item[vehicle_category]"

      assert_select "input[name=?]", "item[speed_unit]"

      assert_select "input[name=?]", "item[speed]"

      assert_select "input[name=?]", "item[capacity]"
    end
  end
end

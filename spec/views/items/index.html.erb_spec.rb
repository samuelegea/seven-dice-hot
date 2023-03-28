require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        name: "Name",
        desc: "MyText",
        category: 2,
        weapon_category: 3,
        weapon_range: 4,
        cost_cp: 5,
        damage: "Damage",
        damage_type: 6,
        range_normal: 7,
        range_long: 8,
        weight: 9,
        properties: 10,
        throw_range_normal: 11,
        throw_range_long: 12,
        two_handed_damage: 13,
        two_handed_damage_type: 14,
        custom: "",
        armor_category: 15,
        armor_class: 16,
        ac_dex_bonus: false,
        max_bonus: 17,
        str_minimum: 18,
        stealth_disadvantage: false,
        gear_category: 19,
        tool_category: 20,
        vehicle_category: 21,
        speed_unit: 22,
        speed: 23,
        capacity: 24
      ),
      Item.create!(
        name: "Name",
        desc: "MyText",
        category: 2,
        weapon_category: 3,
        weapon_range: 4,
        cost_cp: 5,
        damage: "Damage",
        damage_type: 6,
        range_normal: 7,
        range_long: 8,
        weight: 9,
        properties: 10,
        throw_range_normal: 11,
        throw_range_long: 12,
        two_handed_damage: 13,
        two_handed_damage_type: 14,
        custom: "",
        armor_category: 15,
        armor_class: 16,
        ac_dex_bonus: false,
        max_bonus: 17,
        str_minimum: 18,
        stealth_disadvantage: false,
        gear_category: 19,
        tool_category: 20,
        vehicle_category: 21,
        speed_unit: 22,
        speed: 23,
        capacity: 24
      )
    ])
  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Damage".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(7.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(8.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(9.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(10.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(11.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(12.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(13.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(14.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(15.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(16.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(17.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(18.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(19.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(20.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(21.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(22.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(23.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(24.to_s), count: 2
  end
end

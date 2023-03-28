require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    assign(:item, Item.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Damage/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(//)
    expect(rendered).to match(/15/)
    expect(rendered).to match(/16/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/17/)
    expect(rendered).to match(/18/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/19/)
    expect(rendered).to match(/20/)
    expect(rendered).to match(/21/)
    expect(rendered).to match(/22/)
    expect(rendered).to match(/23/)
    expect(rendered).to match(/24/)
  end
end

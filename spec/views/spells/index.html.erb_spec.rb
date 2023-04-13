require 'rails_helper'

RSpec.describe "spells/index", type: :view do
  before(:each) do
    assign(:spells, [
      Spell.create!(
        name: "Name",
        desc: "MyText",
        school: 2,
        components: 3,
        material: "Material",
        ritual: false,
        duration_number: 4,
        duration_unit: 5,
        duration_delimiter: 6,
        concentration: false,
        casting_time_unitt: 7,
        casting_time_number: 8,
        level: 9,
        attack_type_melee: false,
        saving_throw: 10,
        dc_success: 11,
        dc_desc: "Dc Desc",
        aoe_type: 12,
        aoe_size: 13
      ),
      Spell.create!(
        name: "Name",
        desc: "MyText",
        school: 2,
        components: 3,
        material: "Material",
        ritual: false,
        duration_number: 4,
        duration_unit: 5,
        duration_delimiter: 6,
        concentration: false,
        casting_time_unitt: 7,
        casting_time_number: 8,
        level: 9,
        attack_type_melee: false,
        saving_throw: 10,
        dc_success: 11,
        dc_desc: "Dc Desc",
        aoe_type: 12,
        aoe_size: 13
      )
    ])
  end

  it "renders a list of spells" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Material".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(7.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(8.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(9.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(10.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(11.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dc Desc".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(12.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(13.to_s), count: 2
  end
end

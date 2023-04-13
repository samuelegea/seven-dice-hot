require 'rails_helper'

RSpec.describe "spells/new", type: :view do
  before(:each) do
    assign(:spell, Spell.new(
      name: "MyString",
      desc: "MyText",
      school: 1,
      components: 1,
      material: "MyString",
      ritual: false,
      duration_number: 1,
      duration_unit: 1,
      duration_delimiter: 1,
      concentration: false,
      casting_time_unitt: 1,
      casting_time_number: 1,
      level: 1,
      attack_type_melee: false,
      saving_throw: 1,
      dc_success: 1,
      dc_desc: "MyString",
      aoe_type: 1,
      aoe_size: 1
    ))
  end

  it "renders new spell form" do
    render

    assert_select "form[action=?][method=?]", spells_path, "post" do

      assert_select "input[name=?]", "spell[name]"

      assert_select "textarea[name=?]", "spell[desc]"

      assert_select "input[name=?]", "spell[school]"

      assert_select "input[name=?]", "spell[components]"

      assert_select "input[name=?]", "spell[material]"

      assert_select "input[name=?]", "spell[ritual]"

      assert_select "input[name=?]", "spell[duration_number]"

      assert_select "input[name=?]", "spell[duration_unit]"

      assert_select "input[name=?]", "spell[duration_delimiter]"

      assert_select "input[name=?]", "spell[concentration]"

      assert_select "input[name=?]", "spell[casting_time_unitt]"

      assert_select "input[name=?]", "spell[casting_time_number]"

      assert_select "input[name=?]", "spell[level]"

      assert_select "input[name=?]", "spell[attack_type_melee]"

      assert_select "input[name=?]", "spell[saving_throw]"

      assert_select "input[name=?]", "spell[dc_success]"

      assert_select "input[name=?]", "spell[dc_desc]"

      assert_select "input[name=?]", "spell[aoe_type]"

      assert_select "input[name=?]", "spell[aoe_size]"
    end
  end
end

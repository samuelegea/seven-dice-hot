require 'rails_helper'

RSpec.describe "weapon_properties/new", type: :view do
  before(:each) do
    assign(:weapon_property, WeaponProperty.new(
      name: "MyString",
      desc: "MyText",
      properties: ""
    ))
  end

  it "renders new weapon_property form" do
    render

    assert_select "form[action=?][method=?]", weapon_properties_path, "post" do

      assert_select "input[name=?]", "weapon_property[name]"

      assert_select "textarea[name=?]", "weapon_property[desc]"

      assert_select "input[name=?]", "weapon_property[properties]"
    end
  end
end

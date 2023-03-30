require 'rails_helper'

RSpec.describe "weapon_properties/edit", type: :view do
  let(:weapon_property) {
    WeaponProperty.create!(
      name: "MyString",
      desc: "MyText",
      properties: ""
    )
  }

  before(:each) do
    assign(:weapon_property, weapon_property)
  end

  it "renders the edit weapon_property form" do
    render

    assert_select "form[action=?][method=?]", weapon_property_path(weapon_property), "post" do

      assert_select "input[name=?]", "weapon_property[name]"

      assert_select "textarea[name=?]", "weapon_property[desc]"

      assert_select "input[name=?]", "weapon_property[properties]"
    end
  end
end

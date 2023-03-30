require 'rails_helper'

RSpec.describe "weapon_properties/show", type: :view do
  before(:each) do
    assign(:weapon_property, WeaponProperty.create!(
      name: "Name",
      desc: "MyText",
      properties: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end

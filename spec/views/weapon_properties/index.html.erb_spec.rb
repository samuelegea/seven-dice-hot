require 'rails_helper'

RSpec.describe "weapon_properties/index", type: :view do
  before(:each) do
    assign(:weapon_properties, [
      WeaponProperty.create!(
        name: "Name",
        desc: "MyText",
        properties: ""
      ),
      WeaponProperty.create!(
        name: "Name",
        desc: "MyText",
        properties: ""
      )
    ])
  end

  it "renders a list of weapon_properties" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end

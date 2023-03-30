require 'rails_helper'

RSpec.describe "magic_items/show", type: :view do
  before(:each) do
    assign(:magic_item, MagicItem.create!(
      name: "Name",
      category: 2,
      rarity: 3,
      variant: false,
      variant_of: nil,
      desc: "MyText",
      properties: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe "magic_items/index", type: :view do
  before(:each) do
    assign(:magic_items, [
      MagicItem.create!(
        name: "Name",
        category: 2,
        rarity: 3,
        variant: false,
        variant_of: nil,
        desc: "MyText",
        properties: ""
      ),
      MagicItem.create!(
        name: "Name",
        category: 2,
        rarity: 3,
        variant: false,
        variant_of: nil,
        desc: "MyText",
        properties: ""
      )
    ])
  end

  it "renders a list of magic_items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end

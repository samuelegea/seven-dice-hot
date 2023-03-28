require 'rails_helper'

RSpec.describe "languages/index", type: :view do
  before(:each) do
    assign(:languages, [
      Language.create!(
        name: "Name",
        rarity: 2,
        script: 1,
      ),
      Language.create!(
        name: "Name",
        rarity: 2,
        script: 1,
      )
    ])
  end

  it "renders a list of languages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end

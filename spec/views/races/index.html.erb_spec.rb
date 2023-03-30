require 'rails_helper'

RSpec.describe "races/index", type: :view do
  before(:each) do
    assign(:races, [
      Race.create!(
        name: "Name",
        desc: "Desc",
        speed: 2,
        size: 3
      ),
      Race.create!(
        name: "Name",
        desc: "Desc",
        speed: 2,
        size: 3
      )
    ])
  end

  it "renders a list of races" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Desc".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end

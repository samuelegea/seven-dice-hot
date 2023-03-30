require 'rails_helper'

RSpec.describe "skills/index", type: :view do
  before(:each) do
    assign(:skills, [
      Skill.create!(
        name: "Name",
        desc: "MyText",
        ability_score: 2
      ),
      Skill.create!(
        name: "Name",
        desc: "MyText",
        ability_score: 2
      )
    ])
  end

  it "renders a list of skills" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end

require 'rails_helper'

RSpec.describe "skills/show", type: :view do
  before(:each) do
    assign(:skill, Skill.create!(
      name: "Name",
      desc: "MyText",
      ability_score: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end

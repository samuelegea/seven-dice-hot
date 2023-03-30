require 'rails_helper'

RSpec.describe "skills/new", type: :view do
  before(:each) do
    assign(:skill, Skill.new(
      name: "MyString",
      desc: "MyText",
      ability_score: 1
    ))
  end

  it "renders new skill form" do
    render

    assert_select "form[action=?][method=?]", skills_path, "post" do

      assert_select "input[name=?]", "skill[name]"

      assert_select "textarea[name=?]", "skill[desc]"

      assert_select "input[name=?]", "skill[ability_score]"
    end
  end
end

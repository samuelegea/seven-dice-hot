require 'rails_helper'

RSpec.describe "klasses/new", type: :view do
  before(:each) do
    assign(:klass, Klass.new(
      name: "MyString",
      hit_die: 1,
      spellcasting_level: 1,
      spellcasting_ability: 1,
      prerequisites: ""
    ))
  end

  it "renders new klass form" do
    render

    assert_select "form[action=?][method=?]", klasses_path, "post" do

      assert_select "input[name=?]", "klass[name]"

      assert_select "input[name=?]", "klass[hit_die]"

      assert_select "input[name=?]", "klass[spellcasting_level]"

      assert_select "input[name=?]", "klass[spellcasting_ability]"

      assert_select "input[name=?]", "klass[prerequisites]"
    end
  end
end

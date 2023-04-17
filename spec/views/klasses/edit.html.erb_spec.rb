require 'rails_helper'

RSpec.describe "klasses/edit", type: :view do
  let(:klass) {
    Klass.create!(
      name: "MyString",
      hit_die: 1,
      spellcasting_level: 1,
      spellcasting_ability: 1,
      prerequisites: ""
    )
  }

  before(:each) do
    assign(:klass, klass)
  end

  it "renders the edit klass form" do
    render

    assert_select "form[action=?][method=?]", klass_path(klass), "post" do

      assert_select "input[name=?]", "klass[name]"

      assert_select "input[name=?]", "klass[hit_die]"

      assert_select "input[name=?]", "klass[spellcasting_level]"

      assert_select "input[name=?]", "klass[spellcasting_ability]"

      assert_select "input[name=?]", "klass[prerequisites]"
    end
  end
end

require 'rails_helper'

RSpec.describe "races/edit", type: :view do
  let(:race) {
    Race.create!(
      name: "MyString",
      desc: "MyString",
      speed: 1,
      size: 1
    )
  }

  before(:each) do
    assign(:race, race)
  end

  it "renders the edit race form" do
    render

    assert_select "form[action=?][method=?]", race_path(race), "post" do

      assert_select "input[name=?]", "race[name]"

      assert_select "input[name=?]", "race[desc]"

      assert_select "input[name=?]", "race[speed]"

      assert_select "input[name=?]", "race[size]"
    end
  end
end

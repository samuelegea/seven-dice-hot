require 'rails_helper'

RSpec.describe "traits/new", type: :view do
  before(:each) do
    assign(:trait, Trait.new(
      name: "MyString",
      desc: "MyText",
      properties: ""
    ))
  end

  it "renders new trait form" do
    render

    assert_select "form[action=?][method=?]", traits_path, "post" do

      assert_select "input[name=?]", "trait[name]"

      assert_select "textarea[name=?]", "trait[desc]"

      assert_select "input[name=?]", "trait[properties]"
    end
  end
end

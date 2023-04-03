require 'rails_helper'

RSpec.describe "traits/edit", type: :view do
  let(:trait) {
    Trait.create!(
      name: "MyString",
      desc: "MyText",
      properties: ""
    )
  }

  before(:each) do
    assign(:trait, trait)
  end

  it "renders the edit trait form" do
    render

    assert_select "form[action=?][method=?]", trait_path(trait), "post" do

      assert_select "input[name=?]", "trait[name]"

      assert_select "textarea[name=?]", "trait[desc]"

      assert_select "input[name=?]", "trait[properties]"
    end
  end
end

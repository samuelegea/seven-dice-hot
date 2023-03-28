require 'rails_helper'

RSpec.describe "languages/edit", type: :view do
  let(:language) {
    Language.create!(
      name: "MyString",
      script: 1,
      rarity: 1
    )
  }

  before(:each) do
    assign(:language, language)
  end

  it "renders the edit language form" do
    render

    assert_select "form[action=?][method=?]", language_path(language), "post" do

      assert_select "input[name=?]", "language[name]"

      assert_select "input[name=?]", "language[type]"
    end
  end
end

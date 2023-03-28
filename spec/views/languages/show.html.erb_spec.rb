require 'rails_helper'

RSpec.describe "languages/show", type: :view do
  before(:each) do
    assign(:language, Language.create!(
      name: "Name",
      rarity: 2,
      script: 1,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1/)
  end
end

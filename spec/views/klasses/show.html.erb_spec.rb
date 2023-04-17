require 'rails_helper'

RSpec.describe "klasses/show", type: :view do
  before(:each) do
    assign(:klass, Klass.create!(
      name: "Name",
      hit_die: 2,
      spellcasting_level: 3,
      spellcasting_ability: 4,
      prerequisites: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
  end
end

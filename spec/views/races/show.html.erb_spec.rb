require 'rails_helper'

RSpec.describe "races/show", type: :view do
  before(:each) do
    assign(:race, Race.create!(
      name: "Name",
      desc: "Desc",
      speed: 2,
      size: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Desc/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end

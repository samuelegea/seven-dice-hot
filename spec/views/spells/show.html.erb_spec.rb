require 'rails_helper'

RSpec.describe "spells/show", type: :view do
  before(:each) do
    assign(:spell, Spell.create!(
      name: "Name",
      desc: "MyText",
      school: 2,
      components: 3,
      material: "Material",
      ritual: false,
      duration_number: 4,
      duration_unit: 5,
      duration_delimiter: 6,
      concentration: false,
      casting_time_unitt: 7,
      casting_time_number: 8,
      level: 9,
      attack_type_melee: false,
      saving_throw: 10,
      dc_success: 11,
      dc_desc: "Dc Desc",
      aoe_type: 12,
      aoe_size: 13
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Material/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/Dc Desc/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
  end
end

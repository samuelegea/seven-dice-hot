require 'rails_helper'

RSpec.describe "klasses/index", type: :view do
  before(:each) do
    assign(:klasses, [
      Klass.create!(
        name: "Name",
        hit_die: 2,
        spellcasting_level: 3,
        spellcasting_ability: 4,
        prerequisites: ""
      ),
      Klass.create!(
        name: "Name",
        hit_die: 2,
        spellcasting_level: 3,
        spellcasting_ability: 4,
        prerequisites: ""
      )
    ])
  end

  it "renders a list of klasses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end

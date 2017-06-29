require 'rails_helper'

RSpec.describe "feelings/show", type: :view do
  before(:each) do
    @feeling = assign(:feeling, Feeling.create!(
      :status => 2,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe "feelings/index", type: :view do
  before(:each) do
    assign(:feelings, [
      Feeling.create!(
        :status => 2,
        :user => nil
      ),
      Feeling.create!(
        :status => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of feelings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

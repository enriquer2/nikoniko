require 'rails_helper'

RSpec.describe 'feelings/new', type: :view do
  before(:each) do
    assign(:feeling, Feeling.new(
                       status: 1,
                       user: nil
    ))
  end

  it 'renders new feeling form' do
    render

    assert_select 'form[action=?][method=?]', feelings_path, 'post' do
      assert_select 'input[name=?]', 'feeling[status]'

      assert_select 'input[name=?]', 'feeling[user_id]'
    end
  end
end

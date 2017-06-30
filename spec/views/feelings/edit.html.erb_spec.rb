require 'rails_helper'

RSpec.describe 'feelings/edit', type: :view do
  before(:each) do
    @feeling = assign(:feeling, Feeling.create!(
                                  status: 1,
                                  user: nil
    ))
  end

  it 'renders the edit feeling form' do
    render

    assert_select 'form[action=?][method=?]', feeling_path(@feeling), 'post' do
      assert_select 'input[name=?]', 'feeling[status]'

      assert_select 'input[name=?]', 'feeling[user_id]'
    end
  end
end

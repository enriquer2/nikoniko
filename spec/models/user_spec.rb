# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  it 'Should have role 3 as default' do
    user = User.new
    expect(user.role).to eq(3)
  end
end

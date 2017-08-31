require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(User.new.role).to eq('employee') }
end

describe User do
  it 'Should have role employee as default' do
    user = User.new
    expect(user.role).to eq('employee')
  end
end

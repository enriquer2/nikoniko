require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(User.new.role).to eq('employee') }
end

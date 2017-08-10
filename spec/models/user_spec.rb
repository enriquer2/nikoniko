# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(User.new.role).to eq(3) }
end

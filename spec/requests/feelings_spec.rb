# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feelings', type: :request do
  describe 'GET /feelings' do
    it 'works! (now write some real specs)' do
      get feelings_path
      expect(response).to have_http_status(200)
    end
  end
end

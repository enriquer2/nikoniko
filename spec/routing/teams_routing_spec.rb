# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamsController, type: :routing do
  describe 'routing' do
    it { expect(get: '/teams').to route_to('teams#index') }
    it { expect(get: '/teams/new').to route_to('teams#new') }
    it { expect(get: '/teams/1').to route_to('teams#show', id: '1') }
    it { expect(get: '/teams/1/edit').to route_to('teams#edit', id: '1') }
    it { expect(post: '/teams').to route_to('teams#create') }
    it { expect(put: '/teams/1').to route_to('teams#update', id: '1') }
    it { expect(patch: '/teams/1').to route_to('teams#update', id: '1') }
    it { expect(delete: '/teams/1').to route_to('teams#destroy', id: '1') }
  end
end

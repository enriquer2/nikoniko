require 'rails_helper'

RSpec.describe FeelingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/feelings').to route_to('feelings#index')
    end

    it 'routes to #new' do
      expect(get: '/feelings/new').to route_to('feelings#new')
    end

    it 'routes to #show' do
      expect(get: '/feelings/1').to route_to('feelings#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/feelings/1/edit').to route_to('feelings#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/feelings').to route_to('feelings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/feelings/1').to route_to('feelings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/feelings/1').to route_to('feelings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/feelings/1').to route_to('feelings#destroy', id: '1')
    end
  end
end

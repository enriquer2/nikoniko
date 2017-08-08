# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeelingsController, type: :routing do
  describe 'routing' do
    it { expect(get: '/feelings').to route_to('feelings#index') }

    it { expect(get: '/feelings/new').to route_to('feelings#new') }

    it { expect(get: '/feelings/1').to route_to('feelings#show', id: '1') }

    it { expect(get: '/feelings/1/edit').to route_to('feelings#edit', id: '1') }

    it { expect(post: '/feelings').to route_to('feelings#create') }

    it { expect(put: '/feelings/1').to route_to('feelings#update', id: '1') }

    it { expect(patch: '/feelings/1').to route_to('feelings#update', id: '1') }

    it { expect(delete: '/feelings/1').to route_to('feelings#destroy', id: '1') }
  end
end

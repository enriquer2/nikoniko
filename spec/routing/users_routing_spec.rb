require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it { expect(get: '/users/sign_in').to route_to('devise/sessions#new') }
    it { expect(post: '/users/sign_in').to route_to('devise/sessions#create') }
    it { expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy') }
    it { expect(get: '/users/password/new').to route_to('devise/passwords#new') }
    it { expect(get: '/users/password/edit').to route_to('devise/passwords#edit') }
    it { expect(patch: '/users/password').to route_to('devise/passwords#update') }
    it { expect(put: '/users/password').to route_to('devise/passwords#update') }
    it { expect(post: '/users/password').to route_to('devise/passwords#create') }
    it { expect(get: '/users/cancel').to route_to('devise/registrations#cancel') }
    it { expect(get: '/users/register').to route_to('devise/registrations#new') }
    it { expect(get: '/users/edit').to route_to('devise/registrations#edit') }
    it { expect(patch: '/users').to route_to('devise/registrations#update') }
    it { expect(put: '/users').to route_to('devise/registrations#update') }
    it { expect(delete: '/users').to route_to('devise/registrations#destroy') }
    it { expect(post: '/users').to route_to('devise/registrations#create') }
  end
end

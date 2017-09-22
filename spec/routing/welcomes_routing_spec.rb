require 'rails_helper'

RSpec.describe WelcomesController, type: :routing do
  describe 'routing' do
    it { expect(get: '/welcomes').to route_to('welcomes#index') }
    it { expect(get: '/welcomes/new').not_to be_routable }
    it { expect(get: '/welcomes/1').not_to be_routable }
    it { expect(get: '/welcomes/1/edit').not_to be_routable }
    it { expect(post: '/welcomes').not_to be_routable }
    it { expect(put: '/welcomes/1').not_to be_routable }
    it { expect(patch: '/welcomes/1').not_to be_routable }
    it { expect(delete: '/welcomes/1').not_to be_routable }
  end
end

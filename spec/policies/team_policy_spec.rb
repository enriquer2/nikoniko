require 'rails_helper'

RSpec.describe TeamPolicy do
  let(:team1) { create(:team) }
  let(:team2) { create(:team) }
  let(:team3) { create(:team) }
  let(:user1) { create(:user, team: team1) }

  shared_examples 'user fully authorized' do
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  shared_examples 'user team authorized' do
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.not_to permit_action(:destroy) }
  end

  shared_examples 'user team not authorized' do
    it { is_expected.to permit_action(:index) } # dejamos esto como permit porque luego nosotros le redirigimos
    it { is_expected.to permit_action(:show) }
    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.not_to permit_action(:destroy) }
  end

  context 'with user admin' do
    subject { described_class.new(create(:admin), team1) }

    it_behaves_like 'user fully authorized'
  end
  context 'with user boss' do
    subject { described_class.new(create(:boss), team1) }

    it_behaves_like 'user fully authorized'
  end
  context 'with user teamleader over his team' do
    subject { described_class.new(create(:teamleader, team: team1), team1) }

    it_behaves_like 'user team authorized'
  end
  context 'with user teamleader over other team' do
    subject { described_class.new(create(:teamleader, team: team2), team3) }

    it_behaves_like 'user team not authorized'
  end
end

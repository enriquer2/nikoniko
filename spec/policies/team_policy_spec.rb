require 'rails_helper'

RSpec.describe TeamPolicy do
  let(:team1) { FactoryGirl.create(:team) }
  shared_examples 'user fully authorized' do
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  shared_examples 'user boss authorized' do
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
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  #### Aqui es donde deberia instanciar dos team, una siendo el mismo que he creado arriba
  #     y otro siendo diferente al de arriba. Por tanto tambien debe tener duplicados del
  #     test porque tendra comportamiento distinto

  context 'with user admin' do
    subject { UserPolicy.new(create(:admin), user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user fully authorized'
  end
  context 'with user boss' do
    subject { UserPolicy.new(create(:boss), user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user boss authorized'
  end
  context 'with user teamleader' do
    subject { UserPolicy.new(create(:teamleader), user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user team authorized'
  end
end
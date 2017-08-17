require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { FactoryGirl.create(:user) }
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

  shared_examples 'user employee authorized' do
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.not_to permit_action(:create) }
    it { is_expected.not_to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.not_to permit_action(:destroy) }
  end

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
  context 'with user employee' do
    subject { UserPolicy.new(create(:employee), user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user employee authorized'
  end
end
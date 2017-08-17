require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { FactoryGirl.create(:user) }
  shared_examples 'user fully authorized' do
    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to permit(:destroy) }
  end

  shared_examples 'user boss authorized' do
    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to permit(:destroy) }
  end

  shared_examples 'user team authorized' do
    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.to permit(:create) }
    it { is_expected.to permit(:new) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to permit(:destroy) }
  end

  shared_examples 'user employee authorized' do
    it { is_expected.to permit(:index) }
    it { is_expected.to permit(:show) }
    it { is_expected.not_to permit(:create) }
    it { is_expected.not_to permit(:new) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
    it { is_expected.not_to permit(:destroy) }
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
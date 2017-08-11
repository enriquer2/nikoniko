require 'rails_helper'

describe UserPolicy do
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
    it { is_expected.to_not permit(:create) }
    it { is_expected.to_not permit(:new) }
    it { is_expected.to permit(:update) }
    it { is_expected.to permit(:edit) }
    it { is_expected.to_not permit(:destroy) }
  end

  context 'with user admin' do
    login_admin
    subject { UserPolicy.new(admin, user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user fully authorized'
  end
  context 'with user admin' do
    login_boss
    subject { UserPolicy.new(boss, user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user boss authorized'
  end
  context 'with user admin' do
    login_teamleader
    subject { UserPolicy.new(teamleader, user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user team authorized'
  end
  context 'with user admin' do
    login_employee
    subject { UserPolicy.new(employee, user) }
    # que puede hacer quien sobre que
    it_behaves_like 'user employee authorized'
  end
end
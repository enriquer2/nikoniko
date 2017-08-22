require 'rails_helper'

RSpec.describe FeelingPolicy do
  let(:feeling1) { create(:f_admin) }
  let(:feeling2) { create(:f_boss) }
  let(:feeling3) { create(:f_teamleader) }
  let(:feeling4) { create(:f_employee) }
  let(:teamleader) { create(:teamleader) }
  let(:feeling_teamleader) { create(:feeling, user: teamleader) }
  let(:employee) { create(:employee) }
  let(:feeling_employee) { create(:feeling, user: employee) }

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

  shared_examples 'user teamleader authorized' do
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
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'with user admin' do
    subject { described_class.new(create(:admin), feeling1) } # que puede hacer quien sobre que

    it_behaves_like 'user fully authorized'
  end
  context 'with user boss' do
    subject { described_class.new(create(:boss), feeling2) }

    it_behaves_like 'user boss authorized'
  end
  context 'with user teamleader' do
    subject { described_class.new(teamleader, feeling3) }

    it_behaves_like 'user teamleader authorized'
  end
  context 'with user employee' do
    subject { described_class.new(employee, feeling4) }

    it_behaves_like 'user employee authorized'
  end
end

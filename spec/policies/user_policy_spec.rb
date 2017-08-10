describe UserPolicy do
  let(:admin) {{FactoryGirl.create(:admin)}} ## revisar!!!!!
  shared_examples 'user fully authorized' do
    before do
      @user = controller.current_user
    end

    describe 'GET #index' do
      it 'returns a success response' do
        @user
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        @user
        get :show, params: { id: @user.to_param }
        expect(response).to be_success
      end
    end
  end
  shared_examples 'user team authorized' do
  end
  shared_examples 'user employer authorized' do
  end

  context 'with user admin' do
    # be login to execute test
    login_admin
    it_behaves_like 'http verbs test'
  end
end
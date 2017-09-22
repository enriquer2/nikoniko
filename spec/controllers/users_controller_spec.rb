require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) { attributes_for(:admin) }
  let(:invalid_attributes) { { name: nil } }
  let(:valid_session) { {} }

  shared_examples 'user fully authorized' do
    before do
      @user = controller.current_user
    end
    describe 'GET #index' do
      it 'returns a success response' do
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: @user.to_param }
        expect(response).to be_success
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: @user.to_param }
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new user' do
          expect do
            post :create, params: { user: valid_attributes }
          end.to change(User, :count).by(1)
        end
        it 'redirects to the created user' do
          post :create, params: { user: valid_attributes }
          expect(response).to redirect_to(User.last)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          post :create, params: { user: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested user' do
          put :update, params: { id: @user.to_param, user: valid_attributes }
          @user.reload
        end
        it 'redirects to the user' do
          put :update, params: { id: @user.to_param, user: valid_attributes }
          expect(response).to redirect_to(@user)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          put :update, params: { id: @user.to_param, user: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested user' do
        @user
        expect do
          delete :destroy, params: { id: @user.to_param }
        end.to change(User, :count).by(-1)
      end
      it 'redirects to the users list' do
        delete :destroy, params: { id: @user.to_param }
        expect(response).to redirect_to(users_url)
      end
    end
  end

  shared_examples 'user as employee authorized' do
    before do
      @user = controller.current_user
    end
    describe 'GET #index' do
      it 'returns a success response' do
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: @user.to_param }
        expect(response).to be_success
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to be_success
      end
    end

  #  describe 'GET #new' do
  #    it 'not allow to return a success response' do
  #      get :new
  #      expect(response).to redirect_to(users_url)
  #    end
  #  end

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: @user.to_param }
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'not allow to create a new user' do
          expect do
            post :create, params: { user: valid_attributes }
          end.to change(User, :count).by(0)
        end
      #  it 'redirects to the users list' do
      #    post :create, params: { user: valid_attributes }
      #    expect(response).to redirect_to(users_url)
      #  end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested user' do
          put :update, params: { id: @user.to_param, user: valid_attributes }
          @user.reload
        end
        it 'redirects to the user' do
          put :update, params: { id: @user.to_param, user: valid_attributes }
          expect(response).to redirect_to(@user)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          put :update, params: { id: @user.to_param, user: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'not allow to destroy the requested user' do
        expect do
          delete :destroy, params: { id: @user.to_param }
        end.to change(User, :count).by(0)
      end
    #  it 'redirects to the users list' do
    #    delete :destroy, params: { id: @user.to_param }
    #    expect(response).to redirect_to(users_url)
    #  end
    end
  end

  context 'with user admin' do
    # be login to execute test
    login_admin
    it_behaves_like 'user fully authorized'
  end

  context 'with user boss' do
    login_boss
    it_behaves_like 'user fully authorized'
  end

  context 'with user teamleader' do
    login_teamleader
    it_behaves_like 'user fully authorized'
  end

  context 'with user employee' do
    login_employee
    it_behaves_like 'user as employee authorized'
  end
end

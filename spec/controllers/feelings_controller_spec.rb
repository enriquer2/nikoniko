require 'rails_helper'

RSpec.describe FeelingsController, type: :controller do
  let(:valid_attributes) { attributes_for(:f_admin) }
  let(:invalid_attributes) { { status: nil, day: nil } }
  let(:feeling) { create(:f_admin) }
  let(:valid_session) { {} }

  shared_examples 'user fully authorized' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        get :show, params: { id: feeling.to_param }
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
        get :edit, params: { id: feeling.to_param }
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new feeling' do
          expect do
            post :create, params: { feeling: valid_attributes }
          end.to change(Feeling, :count).by(1)
        end
        it 'redirects to the created feeling' do
          post :create, params: { feeling: valid_attributes }
          expect(response).to redirect_to(Feeling.last)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          post :create, params: { feeling: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested feeling' do
          put :update, params: { id: feeling.to_param, feeling: valid_attributes }
          feeling.reload
        end
        it 'redirects to the feeling' do
          put :update, params: { id: feeling.to_param, feeling: valid_attributes }
          expect(response).to redirect_to(feeling)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          put :update, params: { id: feeling.to_param, feeling: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested feeling' do
        feeling
        expect do
          delete :destroy, params: { id: feeling.to_param }
        end.to change(Feeling, :count).by(-1)
      end

      it 'redirects to the feelings list' do
        delete :destroy, params: { id: feeling.to_param }
        expect(response).to redirect_to(feelings_url)
      end
    end
  end

  context 'with user admin' do
    # be login to execute test
    login_admin
    it_behaves_like 'user fully authorized'
  end
  context 'with user admin' do
    # be login to execute test
    login_boss
    it_behaves_like 'user fully authorized'
  end
  context 'with user admin' do
    # be login to execute test
    login_teamleader
    it_behaves_like 'user fully authorized'
  end
  context 'with user admin' do
    # be login to execute test
    login_employee
    it_behaves_like 'user fully authorized'
  end
end

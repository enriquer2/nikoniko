require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:valid_attributes) { attributes_for(:team) }
  let(:team) { create(:team) }
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
        get :show, params: { id: team.to_param }
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
        get :edit, params: { id: team.to_param }
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new team' do
          expect do
            post :create, params: { team: valid_attributes }
          end.to change(Team, :count).by(1)
        end
        it 'redirects to the created team' do
          post :create, params: { team: valid_attributes }
          expect(response).to redirect_to(Team.last)
        end
      end

      context 'with invalid params' do
        it 'returns a success response' do
          post :create, params: { team: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested team' do
          put :update, params: { id: team.to_param, team: valid_attributes }
          team.reload
        end
        it 'redirects to the team' do
          put :update, params: { id: team.to_param, team: valid_attributes }
          expect(response).to redirect_to(team)
        end
      end

      context'with invalid params' do
        it 'returns a success response' do
          put :update, params: { id: team.to_param, team: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested user' do
        team # necesitamos llamar a team para que cuando haga el borrado en destroy no cree el team con "team.to_param"
        count = Team.count
        delete :destroy, params: { id: team.to_param }
        expect(Team.count).to eq(count - 1)
      end
      it 'redirects to the users list' do
        delete :destroy, params: { id: team.to_param }
        expect(response).to redirect_to(teams_url)
      end
    end
  end

  shared_examples 'user as teamleader authorized' do
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
        get :show, params: { id: team.to_param }
        expect(response).to be_success
      end
    end

    describe 'GET #new' do
      it 'not allow to return a success response' do
        get :new
        expect(response).to redirect_to(teams_url)
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        get :edit, params: { id: team.to_param }
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'not allow to create a new user' do
          expect do
            post :create, params: { team: valid_attributes }
          end.to change(User, :count).by(0)
        end
        it 'redirects to the users list' do
          post :create, params: { team: valid_attributes }
          expect(response).to redirect_to(teams_url)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        it 'updates the requested user' do
          put :update, params: { id: team.to_param, team: valid_attributes }
          team.reload
        end
        it 'redirects to the user' do
          put :update, params: { id: team.to_param, team: valid_attributes }
          expect(response).to redirect_to(team)
        end
      end

      context'with invalid params' do
        it 'returns a success response' do
          put :update, params: { id: team.to_param, team: invalid_attributes }
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'not allow to destroy the requested user' do
        expect do
          delete :destroy, params: { id: team.to_param }
        end.to change(User, :count).by(0)
      end
      it 'redirects to the users list' do
        delete :destroy, params: { id: team.to_param }
        expect(response).to redirect_to(teams_url)
      end
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
    it_behaves_like 'user as teamleader authorized'
  end
end

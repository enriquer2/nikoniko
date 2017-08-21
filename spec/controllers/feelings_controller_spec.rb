require 'rails_helper'

RSpec.describe FeelingsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      feeling = Feeling.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      feeling = Feeling.create! valid_attributes
      get :show, params: { id: feeling.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      feeling = Feeling.create! valid_attributes
      get :edit, params: { id: feeling.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Feeling' do
        expect do
          post :create, params: { feeling: valid_attributes }, session: valid_session
        end.to change(Feeling, :count).by(1)
      end

      it 'redirects to the created feeling' do
        post :create, params: { feeling: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Feeling.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { feeling: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested feeling' do
        feeling = Feeling.create! valid_attributes
        put :update, params: { id: feeling.to_param, feeling: new_attributes }, session: valid_session
        feeling.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the feeling' do
        feeling = Feeling.create! valid_attributes
        put :update, params: { id: feeling.to_param, feeling: valid_attributes }, session: valid_session
        expect(response).to redirect_to(feeling)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        feeling = Feeling.create! valid_attributes
        put :update, params: { id: feeling.to_param, feeling: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested feeling' do
      feeling = Feeling.create! valid_attributes
      expect do
        delete :destroy, params: { id: feeling.to_param }, session: valid_session
      end.to change(Feeling, :count).by(-1)
    end

    it 'redirects to the feelings list' do
      feeling = Feeling.create! valid_attributes
      delete :destroy, params: { id: feeling.to_param }, session: valid_session
      expect(response).to redirect_to(feelings_url)
    end
  end
end

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET#new' do
    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST#create' do
    #
    # before :each do
    #   create :user
    # end

    let(:valid_params) {{user: {username: 'iamwill', password: 'totallynotapassword'}}}###############
    let(:invalid_params) {{user: {password: 'totallynotapassword'}}}

    context 'with valid params' do
      it 'saves the user to the db' do
        post :create, params: valid_params
        expect(User.last.is_password?('totallynotapassword')).to be true
      end
    end

    context 'with invalid params' do
      before :each do
        post :create, params: invalid_params
      end
      
      it 'redirects to new user page' do
        expect(response).to have_http_status(422)
        expect(response).to render_template(:new)
      end
      it 'adds error to flash' do
        expect(flash[:errors]).to be_present
      end
    end
  end
end

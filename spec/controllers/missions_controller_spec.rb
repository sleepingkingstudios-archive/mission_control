# spec/controllers/missions_controller_spec.rb

require 'spec_helper'

RSpec.describe MissionsController do
  context 'as an anonymous user' do
    describe 'GET /missions' do
      before(:each) { get :index }

      specify { expect(response.status).to be == 302 }
      specify 'redirects to root' do
        expect(response).to redirect_to new_user_session_path
      end # specify
    end # describe
  end # context

  context 'as a signed-in user' do
    let(:user) { FactoryGirl.create :user }

    before(:each) { sign_in user }

    describe 'GET /missions' do
      before(:each) { get :index }

      specify { expect(response.status).to be == 200 }
      specify 'renders index' do
        expect(response).to render_template :index
      end # specify
    end # describe
  end # context
end # describe

# spec/controllers/missions_controller_spec.rb

require 'spec_helper'

RSpec.describe MissionsController do
  describe 'GET /missions' do
    before(:each) { get :index }

    specify { expect(response.status).to be == 200 }
    specify 'renders index' do
      expect(response).to render_template :index
    end # specify
  end # describe
end # describe

# app/controllers/missions_controller.rb

class MissionsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :only => %i(index)
  respond_to :json

  # GET /missions
  def index
    respond_with(@missions = current_user.missions)
  end # action index

  # POST /missions
  def create
    @mission = Mission.new params[:mission]
    @mission.save
    respond_with @mission
  end # action create
end # controller

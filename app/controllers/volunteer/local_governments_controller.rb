class Volunteer::LocalGovernmentsController < ApplicationController
  before_action :authenticate_volunteer!
  
  def index
    @local_governments = LocalGovernment.all
  end

  def show
    @local_government = LocalGovernment.find(params[:id])
  end
end
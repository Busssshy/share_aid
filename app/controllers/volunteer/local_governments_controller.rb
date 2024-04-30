class Volunteer::LocalGovernmentsController < ApplicationController
  def index
    @local_governments = LocalGovernment.all
  end


  def show
    @local_government = LocalGovernment.find(params[:id])
    @stocks = @local_government.stocks

  end
end

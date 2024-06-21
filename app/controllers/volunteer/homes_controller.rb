class Volunteer::HomesController < ApplicationController
  before_action :authenticate_volunteer!
  
  def top
  end

  def about
  end
end

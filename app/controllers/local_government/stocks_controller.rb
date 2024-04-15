class LocalGovernment::StocksController < ApplicationController
  before_action :authenticate_local_government!
  
  def new
    @stock = Stock.new
  end

  def edit
  end
end

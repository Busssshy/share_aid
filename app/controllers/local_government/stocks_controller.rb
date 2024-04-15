class LocalGovernment::StocksController < ApplicationController
  before_action :authenticate_local_government!
  
  def new
    @stock = Stock.new
  end
  
  def index
    @stocks = Stock.page(params[:page]).per(10)
  end

  def edit
  end
end

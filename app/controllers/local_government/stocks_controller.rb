class LocalGovernment::StocksController < ApplicationController
  def new
  end

  def edit
    @stock = Stock.find(params[:id])
  end
  
  def update
    if @stock.update(stock_params)
      redirect_to
  end
end

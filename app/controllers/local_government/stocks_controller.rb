class LocalGovernment::StocksController < ApplicationController
  def new
  end

  def edit
    @stock = Stock.find(params[:id])
  end
  
  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      redirect_to local_government_stocks_path
  end
  
  private
  
  
  
  
  
  
  
  # ↓↓↓追加したカラムを追加する
  def stock_params
    params.require(:stock).permit(:name, :amount, :deadline, :memo)
  end
end

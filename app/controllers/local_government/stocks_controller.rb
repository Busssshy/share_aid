class LocalGovernment::StocksController < ApplicationController
  before_action :authenticate_local_government!
  
  def new
    @stock = Stock.new
  end
  
  def create
    @stock = Stock.new(stock_params)
    @stock.local_government_id = current_local_government.id
    @stock.save
    redirect_to local_government_stocks_path
  end  

  def edit
  end
  
  private
  
  
  
  
  
  
  
  # ↓↓↓追加したカラムを追加する
  def stock_params
    params.require(:stock).permit(:name, :amount, :deadline, :memo)
  end  
end

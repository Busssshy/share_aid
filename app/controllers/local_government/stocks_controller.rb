class LocalGovernment::StocksController < ApplicationController
  before_action :authenticate_local_government!

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      current_local_government.stock << @stock
      flash[:notice] = "登録しました。"
      redirect_to local_government_stocks_path
    else
      render "new"
    end
  end
  
  def index
    @stocks = Stock.page(params[:page]).per(10)
  end

  def edit
  end

  private

  def stock_params
    params.require(:local_government).permit(:name, :amount, :one_daily_quantity, :deadline, :memo)
  end
end

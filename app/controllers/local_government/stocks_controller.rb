class LocalGovernment::StocksController < ApplicationController
  before_action :authenticate_local_government!

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.local_government_id = current_local_government.id
    if @stock.save
      flash[:notice] = "登録しました。"
      redirect_to local_government_stocks_path
    else
      render "new"
    end
  end

  def index
  end

  def edit
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :amount, :one_daily_quantity, :deadline, :memo)
  end
end
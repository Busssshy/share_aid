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
    if params[:old]
      @stocks = current_local_government.stocks.old.page(params[:page]).per(10)
    elsif params[:deadline]
      @stocks = current_local_government.stocks.deadline.page(params[:page]).per(10)
    else
      @stocks = current_local_government.stocks.latest.page(params[:page]).per(10)
    end

    @reservation_items = ReservationDetail.joins(stock: :local_government).where("local_governments.id = ?", current_local_government.id)

  end

  def edit
    @stock = Stock.find(params[:id])
    unless current_local_government == @stock.local_government
      flash[:alert] = "他自治体の在庫情報は編集出来ません。"
      redirect_back(fallback_location: local_government_stocks_path)
      return
    end
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      flash[:notice] = "編集内容を反映させました。"
      redirect_to local_government_stocks_path
    else
      flash[:alert] = "編集内容の保存が出来ませんでした。"
      redirect_to request.referer
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    if stock.destroy
      flash[:notice] = "在庫情報を削除しました。"
      redirect_to local_government_stocks_path
    else
      render :edit
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :amount, :one_daily_quantity, :deadline, :memo)
  end
end

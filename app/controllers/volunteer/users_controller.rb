class Volunteer::UsersController < ApplicationController
  before_action :set_volunteer

  def show
  end

  def edit
  end

  def update
    if @volunteer.update(volunteer_params)
      redirect_to request.referer, notice: "アカウント情報が更新されました"
    else
      render "edit"
    end
  end

private

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, :password, :phone_number, :post_code, :address)
  end

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end
end

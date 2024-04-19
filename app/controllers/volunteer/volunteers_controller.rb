class Volunteer::VolunteersController < ApplicationController
  before_action :set_volunteer

  def show
  end

  def edit
  end

  def update
    if @volunteer.update(volunteer_params)
      flash[:notice] = "アカウント情報が更新されました"
      redirect_to request.referer
    else
      flash[:notice] = "情報の更新に失敗しました。"
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
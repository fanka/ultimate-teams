class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def change_admin_status
    @user = User.find(params[:id])
    @user.change_admin_status
    redirect_to admins_path, notice: "Yay"
  end

end

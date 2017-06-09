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

    respond_to do |format|
      format.html { redirect_to admins_path }
      format.json { render json: @user }
    end
  end

end

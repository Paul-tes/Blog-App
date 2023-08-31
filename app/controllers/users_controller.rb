class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def logout
    sign_out current_user
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController

  skip_before_filter :check_user

  respond_to :json

  def index
    @users = User.all

    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])

    respond_with(@user)
  end

  def destroy
    cookies[:user_id] = nil
    redirect_to users_path
  end

  def select
    cookies[:user_id] = params[:user][:id]
    redirect_to root_path
  end

end

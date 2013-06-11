class UsersController < ApplicationController

  skip_before_filter :check_user

  def index
    @users = User.all
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

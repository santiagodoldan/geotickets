class UsersController < ApplicationController

  # Skip authentication until using device
  skip_before_filter :check_user

  def index
    @users = User.all

    respond_with(@users)
  end

  #
  # Remove when adding device

  def logged_in_user
    @user = User.find_by_id(cookies[:user_id])

    respond_with(@user)
  end

  def login
    @user = User.find(params[:id])

    cookies[:user_id]= @user.id
    cookies[:username]= @user.name

    respond_with(@user)
  end

  def logout
    cookies[:user_id]= nil
    cookies[:username]= nil

    respond_with(@user)
  end

end

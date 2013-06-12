class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_user, :current_user

  private

  def check_user
    unless cookies[:user_id].present?
      redirect_to users_path
    end
  end

  def current_user
    @user = User.find_by_id(cookies[:user_id])
  end
  helper_method :current_user

end

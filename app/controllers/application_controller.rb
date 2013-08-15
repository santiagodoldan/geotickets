class ApplicationController < ActionController::Base

  protect_from_forgery

  respond_to :json

  before_filter :check_user, :current_user

  private

  def check_user
    render file: 'public/401.html', layout: false, status: :unauthorized unless cookies[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by_id(cookies[:user_id])
  end

end

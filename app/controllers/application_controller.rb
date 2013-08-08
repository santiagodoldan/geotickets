class ApplicationController < ActionController::Base

  protect_from_forgery

  respond_to :json

  before_filter :check_user, :current_user

  layout :select_layout

  private

  def check_user
    #raise 'User not logger In' unless cookies[:user_id].present?
  end

  def current_user
    @current_user ||= User.first
    #@current_user ||= User.find_by_id(cookies[:user_id])
  end

  def select_layout
    if params[:format] == 'angr'
      false
    else
      'application'
    end
  end

end

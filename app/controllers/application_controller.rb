class ApplicationController < ActionController::Base

  protect_from_forgery

  # Checks that every controller that inherits from this
  #   one has the correct permissions to access.
  #
  check_authorization

  respond_to :json

  before_filter :check_user, :current_user, :allow_html_on_every_action

  # Sets the correct permissions for current user.
  #
  def current_ability
    ::Ability.new
  end

  private

  # If current request wasn't of JSON type just render the dashboard view.
  #
  def allow_html_on_every_action
    render 'dashboard/index' and return if request.format == 'text/html'
  end

  def check_user
    render file: 'public/401.html', layout: false, status: :unauthorized unless cookies[:user_id].present?
  end

  def current_user
    @current_user ||= User.find_by_id(cookies[:user_id])
  end

end

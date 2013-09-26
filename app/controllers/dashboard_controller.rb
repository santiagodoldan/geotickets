class DashboardController < ApplicationController

  skip_before_filter :check_user
  skip_authorization_check

  def index; end

end
class DashboardController < ApplicationController

  skip_before_filter :check_user

  def index; end

end
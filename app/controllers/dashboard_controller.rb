class DashboardController < ApplicationController

  def index
    @worked_hour = WorkedHour.new

    @tags = Tag.all
    @tickets = Ticket.all
  end

end
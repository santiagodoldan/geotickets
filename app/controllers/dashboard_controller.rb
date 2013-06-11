class DashboardController < ApplicationController

  def index
    @worked_hour = WorkedHour.new

    @tags = Tag.all
    @tickets = Ticket.all
    @epics = Epic.all

    @log = WorkedHour.for_this_week
  end

end
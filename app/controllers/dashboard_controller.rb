class DashboardController < ApplicationController

  def index
    @worked_hour = WorkedHour.new

    @tags = Tag.all
    @tickets = Ticket.all
    @epics = Epic.all

    if (week_date = params[:week_date].try(:to_date)).present?
      @log = WorkedHour.in_week(week_date).grouped_by_day
    else
      @log = WorkedHour.for_this_week
    end
  end

end
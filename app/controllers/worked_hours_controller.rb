class WorkedHoursController < ApplicationController

  def index
    @worked_hours = current_user.search_worked_hours(params)

    respond_with(@worked_hours)
  end

  def create
    @worked_hour = current_user.worked_hours.create(params[:worked_hour])

    respond_with(@worked_hour)
  end

  def update
    @worked_hour = current_user.worked_hours.find(params[:id])
    @worked_hour.update_attributes(params[:worked_hour])

    respond_with(@worked_hour)
  end

  def destroy
    @worked_hour = current_user.worked_hours.find(params[:id])
    @worked_hour.destroy

    respond_with(@worked_hour)
  end

end

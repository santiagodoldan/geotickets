class WorkedHoursController < ApplicationController

  before_filter :preload_worked_hours, only: [:index]

  load_and_authorize_resource through: :current_user

  # Lists all the worked hours for current user or if having
  #   an specific sprint context only the worked hours for that srint.
  #
  # GET /worked_hours
  # GET /sprints/:sprint_id/worked_hours
  def index
    if params[:on]
      @worked_hours = @worked_hours.search(on_eq: params[:on]).result
    end

    respond_with(@worked_hours)
  end

  # Creates given worked hour.
  #
  # POST /worked_hours
  def create
    @worked_hour.save

    respond_with(@worked_hour)
  end

  # Updates given worked hour.
  #
  # PUT /worked_hours/:id
  def update
    @worked_hour.update_attributes(params[:worked_hour])

    respond_with(@worked_hour)
  end

  # Destroys given worked hour.
  #
  # DELETE /worked_hours/:id
  def destroy
    @worked_hour.destroy

    respond_with(@worked_hour)
  end

  private

  # Returns the correct worked hours depending on current path.
  #
  # @return [ActiveRecord::Relation<WorkedHour>]
  def preload_worked_hours
    @worked_hours = if params[:sprint_id].present?
      Sprint.find(params[:sprint_id]).worked_hours
    else
      current_user.worked_hours
    end
  end

end

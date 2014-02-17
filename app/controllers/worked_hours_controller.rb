class WorkedHoursController < ApplicationController

  load_and_authorize_resource through: :current_user

  before_filter :filter_by_date, only: [:index, :extra]

  # Lists all the worked hours for current user
  #
  # GET /worked_hours
  def index
    @worked_hours = @worked_hours.not_extra

    respond_with(@worked_hours)
  end

  # Lists all the extra worked hours for current user
  #
  # GET /worked_hours/extra
  def extra
    @worked_hours = @worked_hours.extra

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

  def filter_by_date
    @worked_hours = @worked_hours.search(on_eq: params[:on]).result if params[:on]
  end

end

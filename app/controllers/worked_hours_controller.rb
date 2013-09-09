class WorkedHoursController < ApplicationController

  before_filter :preload_context

  def index
    # TODO: add ransack gem to avoid doing search methods and delegate
    #   that responsability to the gem.
    #
    if @context.kind_of?(User)
      @worked_hours = @context.search_worked_hours(params)
    else
      @worked_hours = @context.worked_hours
    end

    respond_with(@worked_hours)
  end

  def create
    @worked_hour = @context.worked_hours.create(params[:worked_hour])

    respond_with(@worked_hour)
  end

  def update
    @worked_hour = @context.worked_hours.find(params[:id])
    @worked_hour.update_attributes(params[:worked_hour])

    respond_with(@worked_hour)
  end

  def destroy
    @worked_hour = @context.worked_hours.find(params[:id])
    @worked_hour.destroy

    respond_with(@worked_hour)
  end

  def preload_context
    if params[:sprint_id].present?
      @context = Sprint.find(params[:sprint_id])
    else
      @context = current_user
    end
  end

end

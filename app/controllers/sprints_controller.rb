class SprintsController < ApplicationController

  load_and_authorize_resource

  # Lists all the sprints available.
  #
  # GET /sprints
  def index
    respond_with(@sprints)
  end

  # Shows given sprint.
  #
  # GET /sprints/:id
  def show
    respond_with(@sprint)
  end

  # Creates an sprint using given data.
  #
  # POST /sprints
  def create
    @sprint.save

    respond_with(@sprint)
  end

  # Updates given sprint with given data.
  #
  # PUT /sprints/:id
  def update
    @sprint.update_attributes(params[:sprint])

    respond_with(@sprint)
  end

  # Destroys given sprint.
  #
  # DELETE /sprints/:id
  def destroy
    @sprint.destroy

    respond_with(@sprint)
  end

  # Returns the active sprint.
  #
  # GET /sprints/active
  def active
    @sprint = @sprints.active.first

    respond_with(@sprint)
  end

end

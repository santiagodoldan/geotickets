class StoriesController < ApplicationController

  load_and_authorize_resource :sprint
  load_and_authorize_resource :story, through: :sprint

  # Lists all the stories for given sprint.
  #
  # GET /sprints/:sprint_id/stories
  def index
    respond_with(@stories)
  end

  # Shows given story.
  #
  # GET /sprints/:sprint_id/stories/:id
  def show
    respond_with(@sprint, @story)
  end

  # Creates a new story for given sprint.
  #
  # POST /sprints/:sprint_id/stories
  def create
    @story.save

    respond_with(@sprint, @story)
  end

  # Updates given story.
  #
  # PUT /sprints/:sprint_id/stories/:id
  def update
    @story.update_attributes(params[:story])

    respond_with(@sprint, @story)
  end

  # Destroys given story.
  #
  # DELETE /sprints/:sprint_id/stories/:id
  def destroy
    @story.destroy

    respond_with(@sprint, @story)
  end

end

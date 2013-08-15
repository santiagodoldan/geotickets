class StoriesController < ApplicationController

  #
  #
  # GET /sprints/:sprint_id/stories
  def index
    @sprint  = Sprint.find(params[:sprint_id])
    @stories = @sprint.stories

    respond_with(@stories)
  end

  #
  #
  # GET /sprints/:sprint_id/stories/:id
  def show
    @sprint = Sprint.find(params[:sprint_id])
    @story  = @sprint.stories.find(params[:id])

    respond_with(@story)
  end

  #
  #
  # POST /sprints/:sprint_id/stories
  def create
    @sprint = Sprint.find(params[:sprint_id])
    @story  = @sprint.stories.new(params[:story])

    @story.save

    respond_with(@story) do |format|
      format.json { render json: @story }
    end
  end

  #
  #
  # PUT /sprints/:sprint_id/stories/:id
  def update
    @sprint = Sprint.find(params[:sprint_id])
    @story  = @sprint.stories.find(params[:id])

    @story.update_attributes(params[:story])

    respond_with(@story)
  end

  #
  #
  # DELETE /sprints/:sprint_id/stories/:id
  def destroy
    @sprint = Sprint.find(params[:sprint_id])
    @story  = @sprint.stories.find(params[:id])

    @story.destroy

    respond_with(@story)
  end

end

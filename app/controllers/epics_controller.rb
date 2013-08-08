class EpicsController < ApplicationController

  def index
    @stories = Epic.all

    respond_with(@stories)
  end

  def show
    @story = Epic.find(params[:id])

    respond_with(@story)
  end

  def create
    @story = Epic.new(params[:epic])
    @story.save

    respond_with(@story)
  end

  def update
    @story = Epic.find(params[:id])
    @story.update_attributes(params[:epic])

    respond_with(@story)
  end

  def destroy
    @story = Epic.find(params[:id])
    @story.destroy

    respond_with(@story)
  end

end

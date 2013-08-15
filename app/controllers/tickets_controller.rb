class TicketsController < ApplicationController

  #
  #
  #
  def index
    @base = if params[:story_id]
      Story.find(params[:story_id])
    else
      Sprint.find(params[:sprint_id])
    end

    @tickets = @base.tickets

    respond_with(@tickets)
  end

  #
  #
  #
  def create
    @story  = Story.find(params[:story_id])
    @ticket = @story.tickets.new(params[:ticket])

    @ticket.save

    respond_with(@story, @ticket)
  end

  #
  #
  #
  def update
    @story  = Story.find(params[:story_id])
    @ticket = @story.tickets.find(params[:id])

    @ticket.update_attributes(params[:ticket])

    respond_with(@story, @ticket)
  end

  #
  #
  #
  def destroy
    @story  = Story.find(params[:story_id])
    @ticket = @story.tickets.find(params[:id])

    @ticket.destroy

    respond_with(@story, @ticket)
  end

end

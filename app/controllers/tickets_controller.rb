class TicketsController < ApplicationController

  before_filter :preload_tickets, only: [:index]

  load_and_authorize_resource only: :index

  load_and_authorize_resource :story, except: :index
  load_and_authorize_resource :ticket, through: :story, except: :index

  # Lists all the tickets for current context.
  #
  # GET /stories/:story_id/tickets
  # GET /sprints/:sprint_id/tickets
  def index
    respond_with(@tickets)
  end

  # Creates a new ticket with given data.
  #
  # POST /stories/:story_id/tickets
  def create
    @ticket.save

    respond_with(@story, @ticket)
  end

  # Updates given ticket with given data.
  #
  # PUT /stories/:story_id/tickets
  def update
    @ticket.update_attributes(params[:ticket])

    respond_with(@story, @ticket)
  end

  # Destroys given ticket.
  #
  # DELETE /stories/:story_id/tickets/:id
  def destroy
    @ticket.destroy

    respond_with(@story, @ticket)
  end

  private

  # Returns tickets for current context.
  #
  # @return [ActiveRecord::Relation<Ticket>]
  def preload_tickets
    @tickets = if params[:story_id]
      Story.find(params[:story_id]).tickets
    else
      Sprint.find(params[:sprint_id]).tickets
    end
  end

end

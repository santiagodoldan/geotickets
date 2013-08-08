class TicketsController < ApplicationController

  def index
    if params[:epic_id]
      @epic    = Epic.find(params[:epic_id])
      @tickets = @epic.tickets
    else
      @tickets = Ticket.scoped
    end

    respond_with(@tickets)
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.save

    respond_with(@ticket)
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update_attributes(params[:ticket])

    respond_with(@ticket)
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_with(@ticket)
  end

end

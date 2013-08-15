class SprintsController < ApplicationController

  def index
    @sprints = Sprint.scoped
    
    respond_with(@sprints)
  end

  def show
    if params[:active]
      @sprint = Sprint.active.first
    else
      @sprint = Sprint.find(params[:id])
    end

    respond_with(@sprint)
  end

end
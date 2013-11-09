class ReportsController < ApplicationController

  load_and_authorize_resource :sprint

  respond_to :json

  def index; end

  def breakdown
    @sprint = Sprint.find(params[:sprint_id])

    respond_with(@sprint.to_report)
  end

end

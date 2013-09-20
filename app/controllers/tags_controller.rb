class TagsController < ApplicationController

  load_and_authorize_resource

  # Lists all the tags availables.
  #
  # GET /tags
  def index
    respond_with(@tags)
  end

end

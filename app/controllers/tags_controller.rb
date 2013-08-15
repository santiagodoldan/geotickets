class TagsController < ApplicationController

  def index
    @tags = Tag.all

    respond_with(@tags)
  end

end

class BookmarksController < ApplicationController

  def new
    @bookmarks = Bookmark.new
  end

  def create
    @lists = List.new
    @bookmarks = Bookmark.new(set_params)
  end

  private

  def set_params
    params.require(something).permit(attributes)
  end
end

class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new # singular
  end

  def create # double check and understand
    @bookmark = Bookmark.new(set_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy # dbl check
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark # dbl check to understand
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list # dbl check to understand
    @list = List.find(params[:list_id])
  end
end

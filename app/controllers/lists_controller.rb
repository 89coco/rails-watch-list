class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new(:name)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @list = List.new(list_params)
    @list.movie = @movie
    @list.save
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

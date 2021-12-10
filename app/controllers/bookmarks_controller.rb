class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:bookmark][:list])
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @list
    else
      render :new
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

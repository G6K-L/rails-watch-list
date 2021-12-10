class ListsController < ApplicationController
  before_action :list_find, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  private

  def list_find
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

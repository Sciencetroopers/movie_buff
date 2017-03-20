class SearchesController < ApplicationController
  def new
    @search = Search.new
    @genres = Movie.uniq.pluck(:genre)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :min_year, :max_year, :genre, :director, :actor)
  end
end

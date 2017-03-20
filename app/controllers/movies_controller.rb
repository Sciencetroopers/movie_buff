class MoviesController < ApplicationController

  before_action :find_movie, :only => [:show, :edit, :update, :delete, :upvote]

  def index
    @moviess = Movie.all.order("created_at DESC") # Order them on basis of likes!
  end

  def show
  end

  def new
    @movie = Movie.new
    #@movie = current_user.movies.build
  end

  def create
    @movie = Movie.new(movie_params)
    #@movie = current_user.movies.build(movie_params)

    if @movie.save
      flash[:notice] = "New Movie Created"
      redirect_to @movie
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:notice] = "Movie Updated"
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path
  end

  # def upvote
  #   @article.upvote_by current_user
  #   redirect_to :back
  # end

  private

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :director,
      :actors, :rating, :year, :month, :genre, :length, :language,
      :link_rt, :link_w, :link_fb)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end

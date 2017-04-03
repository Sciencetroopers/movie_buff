class MoviesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin, except: [:index, :show, :upvote]
  before_action :find_movie, :only => [:show, :edit, :update, :delete, :upvote]

  def index
    @movies = Movie.search(params[:search]).shuffle.first(6)
    @random_movie_1 = Movie.where.not(id: @movie).order("RANDOM()")
    @random_movie_2 = Movie.where.not(id: @movie).order("RANDOM()")
    @random_movie_3 = Movie.where.not(id: @movie).order("RANDOM()")
  end

  def show
    @reviews = @movie.reviews
    @random_movie = Movie.where.not(id: @movie).order("RANDOM()").first
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)

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

  def upvote
    @movie.upvote_by current_user
    redirect_to :back
  end

  private

  def movie_params
    params.require(:movie).permit(:image, :cover, :title, :synopsis, :director,
      :actors, :rating, :year, :month, :genre, :length, :language,
      :link_rt, :link_w, :link_fb)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def authenticate_admin
    redirect_to root_path unless current_user.admin == true
  end

end

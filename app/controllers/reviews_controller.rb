class ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_movie

  def create
    @review = @movie.reviews.create(review_params)

    @review.user = current_user

    if @review.save
      redirect_to @movie, notice: 'review was successfully added'
    else
      render 'new'
    end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy

    redirect_to movie_path(@movie)
  end

  def upvote
    @review = @movie.reviews.find(params[:id])
    @review.upvote_by current_user

    redirect_to :back
  end

  private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :body, :movie_id, :user_id)
  end

end

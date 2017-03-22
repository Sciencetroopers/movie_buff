class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)

    @review.user = current_user

    if @review.save
      redirect_to @movie, notice: 'review was successfully added'
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy

    redirect_to movie_path(@movie)
  end

  # def upvote
  #   @movie = movie.find(params[:movie_id])
  #   @review = @movie.reviews.find(params[:id])
  #   @review.upvote_by current_user
  #
  #   redirect_to :back
  # end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :movie_id, :user_id)
  end
end

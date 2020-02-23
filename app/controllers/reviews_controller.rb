class ReviewsController < ApplicationController

  before_action :set_movie, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to movie_path(@review.movie)
    else
      redirect_to new_movie_review_path
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:body, :movie_id).merge(user_id: current_user.id)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end

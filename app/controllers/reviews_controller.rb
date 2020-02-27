class ReviewsController < ApplicationController
  
  before_action :set_movie, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(
      body: review_params[:body],
      user_id: current_user.id,
      movie_id: params[:movie_id],
      rating: review_params[:rating],
    )

    if @review.save
      redirect_to movie_path(@review.movie)
    else
      redirect_to new_movie_review_path
    end
  end

  def edit
  end

  def update
    if @review.update(
      body: review_params[:body],
      user_id: current_user.id,
      movie_id: params[:movie_id],
      rating: review_params[:rating],
    )
      redirect_to movie_path(@review.movie)
    else
      redirect_to edit_movie_review_path
    end
  end

  def destroy
    if @review.destroy
      redirect_to movie_path(@review.movie)
    else
      redirect_to edit_movie_review_path
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:body, :movie_id, :user_id, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

end

class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order("created_at DESC")
  end

  def show
    @movie = Movie.find(params[:id])
    if @movie.reviews.blank?
      @average_review = 0
    else
      @average_review = @movie.reviews.average(:rating).round(2)
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to root_path
    else
      redirect_to new_movie_path
    end
  end

  def search
    @movies = Movie.search(params[:keyword]).order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :image)
  end


end

class MoviesController < ApplicationController

  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.all.order("created_at DESC")
  end

  def show
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

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :image)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

end

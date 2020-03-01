class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_movie, only: [:edit, :update, :show, :destroy]

  def index
    @movies = Movie.all.order("created_at DESC")
  end

  def show
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

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to root_path
    else
      redirect_to edit_movie_path
    end
  end

  def search
    @movies = Movie.search(params[:keyword]).order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    if @movie.destroy
      redirect_to root_path
    else
      redirect_to movie_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :image)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end

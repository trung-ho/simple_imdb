class MoviesController < ApplicationController
  def index
    @categories = Category.all
    
    if params[:category_id].present?
      @movies = Category.find(params[:category_id]).movie.order(created_at: :desc).page(params[:page])
    else
      @movies = Movie.all.includes(:categories, :ratings).order(created_at: :desc).page(params[:page])
    end
  end

  def show
    @movie = Movie.find params[:id]
  end
end

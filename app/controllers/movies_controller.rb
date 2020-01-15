class MoviesController < ApplicationController
  def index
    @categories = Category.all
    
    if params[:category_id].present?
      @movies = Category.find(params[:category_id]).movies.page(params[:page])
    else
      @movies = Movie.all.includes(:categories, :ratings).page(params[:page])
    end
  end

  def show
    @movie = Movie.find params[:id]
  end
end

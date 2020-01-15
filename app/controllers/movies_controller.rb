class MoviesController < ApplicationController
  def index
    @movies = Movie.all.includes(:categories, :ratings).page(params[:page])
  end

  def show
    @movie = Movie.find params[:id]
  end
end

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.includes(:categories)
  end

  def show
    @movie = Movie.find params[:id]
  end
end

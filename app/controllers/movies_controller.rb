class MoviesController < ApplicationController
  def index
    @movies = Movie.all.includes(:categories)
  end
end

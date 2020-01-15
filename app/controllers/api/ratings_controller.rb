require 'open-uri'

module Api
  class RatingsController < ActionController::API
    def create
      rating = current_user.ratings.new movie_id: params[:movie_id]
      if rating.save
        render json: {success: true}, status: :ok
      else
        render json: {success: false}, status: :bad_request
      end
    end
  end
end
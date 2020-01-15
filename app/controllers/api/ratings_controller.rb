module Api
  class RatingsController < ActionController::API
    def create
      rating = current_user.ratings.new movie_id: params[:movie_id], score: params[:score].to_f
      if rating.save
        render json: {success: true}, status: :ok
      else
        render json: {success: false}, status: :bad_request
      end
    end

    def update
      rating = current_user.ratings.where(id: params[:id]).last
      if rating.present?
        rating.update score: params[:score].to_f
        render json: {success: true}, status: :ok
      else
        render json: {error: 'not found'}, status: :not_found
      end
    end
  end
end
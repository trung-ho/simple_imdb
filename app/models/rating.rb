class Rating < ApplicationRecord
  validates_presence_of :score
  validates_inclusion_of :score, in: 1..5
  validates_uniqueness_of :user, scope: :movie_id

  belongs_to :movie
  belongs_to :user

  after_save :update_movie_rating

  private
  def update_movie_rating
    average_socre = self.movie.ratings.average(:score)
    self.movie.update average_rate: average_socre
  end
end
class Movie < ApplicationRecord
  paginates_per 9

  validates_presence_of :title
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  has_many :ratings

  def rated_by user
    return (self.ratings.where user: user).last
  end
end
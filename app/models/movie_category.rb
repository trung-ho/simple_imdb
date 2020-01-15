class MovieCategory < ApplicationRecord
  belongs_to :movie
  belongs_to :category
  validates_uniqueness_of :category, scope: :movie_id
end
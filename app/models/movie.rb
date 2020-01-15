class Movie < ApplicationRecord
  validates_presence_of :title
  has_many :movie_categories
  has_many :categories, through: :movie_categories
end
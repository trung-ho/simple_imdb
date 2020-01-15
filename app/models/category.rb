class Category < ApplicationRecord
  validates_presence_of :name
  has_many :movie_categories
  has_many :movies, through: :movie_categories
end
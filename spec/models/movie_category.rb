require 'rails_helper'

RSpec.describe MovieCategory, type: :model do
  describe 'associations' do
    before do
      @movie = Movie.create title: 'Hello World'
      @category = Category.create name: 'drama'
      @movie.movie_categories.create category: @category
    end
    
    it { should belong_to(:category) }
    it { should belong_to(:movie) }
    it { should validate_uniqueness_of(:category).scoped_to(:movie_id) }
  end
end

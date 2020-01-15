require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

  describe 'after_save' do
    before do
      @movie = Movie.create title: 'Hello World'
      @user = User.create email: 'user@example.com', password: 'password'
      @user2 = User.create email: 'user2@example.com', password: 'password'
    end
    it 'should update movie average rate' do
      expect { 
        @user.ratings.create movie: @movie, score: 5
      }.to change { @movie.average_rate }.from(nil).to(5.0)
      expect { 
        @user2.ratings.create movie: @movie, score: 1
      }.to change { @movie.average_rate }.from(5.0).to(3.0)
    end
  end
end

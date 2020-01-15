# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..100).each do |count|
  break if Movie.all.size > 99
  movie_title = Faker::Lorem.sentence(word_count: rand(1..7)) 
  movie_description = Faker::Lorem.paragraph(sentence_count: rand(1..5)) 
  Movie.create(title: movie_title, description: movie_description)
end

(1..10).each do |count|
  break if Category.all.size > 9
  category_name = Faker::Lorem.words(number: 3).join(' ')
  Category.create(name: category_name)
end

if MovieCategory.all.size < 100
  Movie.all.each do |movie|
    next if movie.movie_categories.any?
    categories = Category.all
    (1..3).each do |count|
      movie.movie_categories.create category: categories.sample
    end
  end
end

(1..10).each do |count|
  break if User.all.size > 9
  User.create(email: Faker::Internet.email, password: 'password')
end

if Rating.all.size < 100
  Movie.all.each do |movie|
    next if movie.ratings.any?
    users = User.all
    (1..3).each do |count|
      movie.ratings.create user: users.sample, score: rand(1..5)
    end
  end
end
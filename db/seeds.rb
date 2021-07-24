# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
results = JSON.parse(movie_serialized)["results"]

results.each do |movie|
  title = movie["title"]
  overview = movie["overview"]
  rating = movie["vote_average"]
  poster_url = movie["poster_path"]
  Movie.create(title: title, overview: overview, rating: rating, poster_url: "https://image.tmdb.org/t/p/original/#{poster_url}")
end
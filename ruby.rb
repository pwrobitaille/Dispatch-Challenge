require 'httparty'
require 'geocoder'
require 'pry'

puts "Please enter an address"
user_address = gets.chomp
address = URI.escape(user_address)

google_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=reataurants+in+#{address}&radius=10000&key=AIzaSyCakzloOI6TYj9uwBVWVleB9fF123zicws"
response = HTTParty.get(google_url)
results = response.parsed_response["results"]

puts "20 Restaurants near #{user_address}"
results.each do |result|
  puts result["name"]
end

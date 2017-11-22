require 'httparty'
require 'pry'

puts "Please enter a street address"
street_address = gets.chomp
puts "Please enter a City"
city = gets.chomp
puts "Please enter a State abbreviation"
state = gets.chomp
puts "Please enter a Zip Code"
zip_code = gets.chomp

puts "\n"

address = "#{street_address} #{city} #{state} #{zip_code}"


google_address = URI.escape(address)

google_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=reataurants+in+#{google_address}&radius=10000&key=AIzaSyCakzloOI6TYj9uwBVWVleB9fF123zicws"
response = HTTParty.get(google_url)
results = response.parsed_response["results"]

puts "20 Restaurants near #{address}"
results.each do |result|
  puts result["name"]
end

puts "\n"

weather_url = "http://api.wunderground.com/api/d66d66cdc63acfa6/forecast/q/#{state}/#{city}.json"
response = HTTParty.get(weather_url)
weather = response.parsed_response

forecasts = weather["forecast"]["txt_forecast"]["forecastday"]
forecast_text = ""

forecasts.each do |forecast|
  forecast_text = forecast["fcttext"]
end

puts "Today's weather for #{address}"
puts forecast_text


# 
#
# concerts_url = "https://app.ticketmaster.com/discovery/v2/events.json?city=#{city}&stateCode=#{state}&apikey=2y8pE4IFAPemvhEV5zfEGqsWkJpy41Ku&size=1"
# response = HTTParty.get(concerts_url)
# concerts = response.parsed_response
# binding.pry

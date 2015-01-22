require "sinatra"
require "HTTParty"
require "json"
require "pry"

#
get "/" do
  erb :lat_long_insta, locals: {images: []}
end

get "/town" do
  data = params[:town]
  puts data
  formatted = data.gsub(" ","+")

  url2 = "https://maps.googleapis.com/maps/api/geocode/json?address=#{formatted}&key=your api key here"
  response2 = HTTParty.get(url2)
  lat_long = response2["results"][0]["geometry"]["location"]
  latitude = lat_long["lat"]
  longitude = lat_long["lng"]

  image_array = []
  url = "https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&client_id=your api key here"
  response = HTTParty.get(url)
  data = response["data"]
  data.each do |position|
    image_array << position["images"]["standard_resolution"]["url"]
  end
  erb :lat_long_insta, locals: {images: image_array}
  # binding.pry
end

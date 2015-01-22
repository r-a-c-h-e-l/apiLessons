require "sinatra"
require "HTTParty"
require "json"
require "pry"

#
get "/" do
  erb :instagram, locals: {images: []}
end

get "/search" do
  image_array = []
  data = params[:search]
  url = "https://api.instagram.com/v1/tags/#{data}/media/recent?client_id=your api key here"
  response = HTTParty.get(url)
  data = response["data"]
  data.each do |position|
    image_array << position["images"]["standard_resolution"]["url"]
  end
  erb :instagram, locals: {images: image_array}
  # binding.pry
end

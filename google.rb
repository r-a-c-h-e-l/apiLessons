require "HTTParty"
# require "pry"

url = "http://api.randomuser.me/"
response = HTTParty.get(url)
user = response['results'][0]['user']

location = {
  city: user["location"]["city"].gsub(" ","+"),
  state: user["location"]["state"]
}

# formatted = location[:city].gsub(" ","+")

url2 = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location[:city]}&key=your api key here"
response2 = HTTParty.get(url2)
latitude = response2["results"][0]["geometry"]["location"]["lat"]
longitude = response2["results"][0]["geometry"]["location"]["long"]
# latitude = lat_long["lat"]
# longitude = lat_long["lng"]
puts location[:city]
puts latitude, longitude
# binding.pry

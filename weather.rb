require 'open-uri'
require 'json'

print "Please enter an address, city, or zip code: "
loc = gets.chomp.gsub(" ","+")

# grab lat/lng from google, then pass in to the OWM api to get weather data
loc_data = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&sensor=true").read)
wea_data = JSON.parse(open("http://api.openweathermap.org/data/2.1/find/station?lat=#{loc_data["results"][0]["geometry"]["location"]["lat"]}&lon=#{loc_data["results"][0]["geometry"]["location"]["lng"]}&cnt=1").read)

# # grab temp in kelvin expressed as a float,
# 	convert to celcius by adding 273.15,
# 	convert to fahrenheit (F=(9/5)*C+32),
# 	then shorten it to one decimal point for easy reading.
temp = '%.1f' % (((wea_data["list"][0]["main"]["temp"].to_f) - 273.15) * 9/5 + 32)
puts "#{temp}f"

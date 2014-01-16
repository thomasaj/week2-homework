require 'open-uri'
require 'json'

# note: have to sub in "+" for spaces to get api to work correctly
print "Please enter an address, city, or zip code: "
loc = gets.chomp.gsub(" ","+")

data = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?address=#{loc}&sensor=true").read)

puts "Latitude:\t#{data["results"][0]["geometry"]["location"]["lat"]}"
puts "Longitude:\t#{data["results"][0]["geometry"]["location"]["lng"]}"

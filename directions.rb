require 'open-uri'
require 'json'

print "Please enter a starting location: "
source = gets.chomp.gsub(" ","+")
print "Please enter a destination:       "
target = gets.chomp.gsub(" ","+")

data = JSON.parse(open("http://maps.googleapis.com/maps/api/directions/json?origin=#{source}&destination=#{target}&sensor=false").read)

puts "Driving travel time:\t#{data["routes"][0]["legs"][0]["duration"]["text"]}"
puts "Distance traveled:\t#{data["routes"][0]["legs"][0]["distance"]["text"]}"

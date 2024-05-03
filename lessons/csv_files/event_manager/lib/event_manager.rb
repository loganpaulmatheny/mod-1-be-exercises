# ./lib/event_manager.rb
require "csv"
require './lib/attendee'
# puts "EventManager initialized."

attendees = []
CSV.foreach('./data/event_attendees.csv', headers:true, header_converters: :symbol) do |row|
  # note the data is first_Name, but the symbols are all lowercase
  id = row[:id]
  first_name = row[:first_name]
  last_name = row[:last_name]
  zipcode = row[:zipcode]
  attendee = Attendee.new(id, first_name, last_name, zipcode)
  puts "#{attendee.id}: #{attendee.full_name}, #{attendee.shorten_zip}"
  attendees.push(attendee)
end
puts attendees.inspect
require 'pry'; binding.pry


## Notes 
#zipcode shorten 
# U
  # some of the zipcodes are longer than 5 digits and we only want them to be 5
# M 
  # 1. we could run a loop and push the first 5 characters to a new variable 
  # 2. we could pop off characters until the length of the symbol is 5
# P 
  # the solution was sligthly more complicated
  # i needed to check and make sure that the zips existed e.g. international
  # i also needed to check for zips whose chars were the proper length e.g. 1234 - needs an extra 0 in front 

# Create an array of attendee objects
  # I'm not sure if this is already bing done or not, I think it's just creating new objects and printing them to the console, before going back in the loop. 
  # U - I think that i will just...okay that was simple and I solved it without the pseduo code etc...
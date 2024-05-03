cities_lived_in = {
    michaela: ["Philadelphia", "Fort Collins", "Seattle"],
    mike: ["Denver", "Santa Fe", "Philadelphia", "Portland"],
    pamela: ["Lansing"],
    alex: ["Seattle", "Columbus", "Philadelphia", "Austin"]
}


# Problem #1: 
# Get a unique list of all of the cities that these humans have lived in  
# ["Philadelphia", "Fort Collins", "Seattle", "Denver", "Santa Fe", "Portland", "Lansing", "Columbus", "Austin"]

# cities_list = cities_lived_in.values.flatten.uniq
cities_list = cities_lived_in.values.flatten

print cities_list

# Problem #2: 
# Write code that iterates through the `cities_lived_in` hash, and returns a list of  
# names of the humans who've lived in Philadelphia.

# [:michaela, :mike, :alex]
# or
# ["Michaela", "Mike", "Alex"]

humans_in_city = cities_lived_in.keys.map {|key| key.to_s.capitalize}
puts humans_in_city



# Problem #3: 
# Create a hash that has the city as a key, and the number of people that live in it as it's value: 

# {
#     "Philadelphia" => 3,
#     "Fort Collins" => 1,
#     "Seattle" =>2,
#     "Denver" => 1,
#     "Santa Fe" => 1,
#     "Portland" => 1,
#     "Lansing" => 1,
#     "Columbus => 1,
#     "Austin" => 1
# }

# flatten the cities into an array - not unique 
# iterate through and create keys in an object (if none exists)
# if the key exists, add one 

cities_population = cities_lived_in.values.flatten.group_by(&:itself).transform_values(&:count)
p cities_population
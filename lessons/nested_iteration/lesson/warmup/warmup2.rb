# Part Two
# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings
# flatten the array then convert to strings

flattened_animal_strings = nested_animals.flatten.map(&:to_s)
p flattened_animal_strings
puts flattened_animal_strings.inspect


# 2. Return an unnested array of animals with length >= 4

flattened_animal_strings_2 = nested_animals.flatten.map(&:to_s).select { |animal| animal.length >= 4}
p flattened_animal_strings_2


# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }

# flatten it 
# map over the elements and add the key-value pairs to the object

animal_hash = nested_animals.flat_map { |flattened_animals| flattened_animals}.to_h { |animal| [animal, animal.length]}

puts animal_hash.inspect
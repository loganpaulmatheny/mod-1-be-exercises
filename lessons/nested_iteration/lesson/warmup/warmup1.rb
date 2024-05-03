# Part One
# Given the follow array:
animals = [:dog, :cat, :zebra, :quokka, :unicorn, :bear]

# Use an enumerable to
# 1. Return an array of animals as strings.

animal_string = animals.map { |animal| animal.to_s }.join(', ')
puts animal_string


# 2. Return an array of animals with a length >= 4.

animal_string_long = animals.select { |animal| animal.to_s.length >= 4 }.join(', ')
puts animal_string_long
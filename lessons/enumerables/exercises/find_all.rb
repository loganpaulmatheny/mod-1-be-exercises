# 1. Using #each, write the code to find all the numbers divisible by 3
# 2. Once you get the method below to work using #each, refactor your code to use #find_all. 


def each_nums_divisible_by_3
    numbers = [1,2,3,4,5,6,7,8,9]
    divisible_three = []
    ### YOUR CODE HERE
    numbers.each do |number|
      if number % 3 == 0
        divisible_three.push(number)
      end
    end 
    divisible_three
    # should return [3,6,9]
end


p each_nums_divisible_by_3


def find_all_nums_divisible_by_3
    numbers = [1,2,3,4,5,6,7,8,9]
    ### YOUR CODE HERE
    numbers.find_all do |number|
      number % 3 == 0
    end 
    # should return [3,6,9]
end


p find_all_nums_divisible_by_3
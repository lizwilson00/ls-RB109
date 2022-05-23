# RB109
# practice_problems.rb

=begin
# problem 1
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:
# problem: 
# for each integer in the array, count the number of distinct numbers
# in the array that are smaller than the number itself
# if a number appears twice, only count it once

# algorithm:
# initialize a results array, results []
# iterate through the array, element by element
# create a subarray that does not include the element that is being iterated
# find the unique values of this subarray
# count the values that are less than the target element
# add the count to the results array

# def smaller_numbers_than_current(array)
#   array_uniq = array.uniq
#   array.map do |num|
#     array_uniq.select do |num_uniq|
#       num > num_uniq
#     end.count
#   end
# end

def smaller_numbers_than_current(array)
  array.map do |num|
    array.uniq.count do |num_uniq|
      num > num_uniq
    end
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# problem 2
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# problem: 
# given a sequence of integers, return the minimum sum of 5 consecutive integers

# algorithm:
# sum = nil
# iterate through the array, starting index will go from 0 to array length - 5
# array[starting index..starting index + 4]
# take the sum of that array, assign that sum to sum if sum is nil or current sum < sum
# continue with my next iteration
# return sum

def minimum_sum(array)
  sum = nil
  0.upto(array.length - 5).each do |start_idx|
    curr_sum = array[start_idx..start_idx + 4].sum
    sum = curr_sum if sum == nil || curr_sum < sum
  end
  sum
end

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
=end

# problem 3
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# problem: 
# given a string, return the string with every 2nd character of 
# every 3rd word converted to uppercase.

# algorithm:
# split the words and save into an array, words_array
# new_words = []
# iterate over the words_array, selecting each word (idx_word)
# word = ''
# iterate over the word, selecting each character (idx_char)
# if idx_word divisible by 3 and idx_char == 1
  # uppercase the character
  # add the character to the variable word
# else
  # add the character to the variable word
# add word to new_words
# return new_words joined together with a space

# def to_weird_case(string)
#   words_array = string.split(' ')
#   new_words = []
#   words_array.each_with_index do |word, idx_word|
#     new_word = ''
#     counter = 0
#     word.chars.each_with_index do |char, idx_char|
#       if (idx_word + 1) % 3 == 0 && (idx_char - 1) % 2 == 0
#         new_word << char.upcase
#       else
#         new_word << char
#       end
#     end
#     new_words << new_word
#   end
#   new_words.join(' ')
# end

# another approach
# create a separate method that takes a string and 
# changes the case of every other letter to uppercase

# algorithm
# initialize a results array []
# split the input string into words
# iterate over each word of the string
# if the index + 1 is divisible by 3 then call
# the every other uppercase method
# add the new word to the results array
# else
# add the word to the results array

def every_other_upcase(string)
  new_string = ''
  string.chars.each_with_index do |char, idx|
    idx.odd? ? new_string << char.upcase : new_string << char
  end
  new_string
end

def to_weird_case(string)
  results = []
  string.split(' ').each_with_index do |word, idx|
    (idx + 1) % 3 == 0 ? results << every_other_upcase(word) :
                         results << word
  end
  results.join(' ')
end

# Examples:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

  =begin
# problem 4
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# problem: given an array of integers, return the two numbers that are 
# closest together in value

# algorithm:
# initialize an array of combinations, []
# find all the combinations of two numbers
  # initialize an array one_combo []
  # iterate through the array, start index idx_first (0..array.length - 1)
    # this number will be added to the one_combo array
  # iterate through the array, idx_second (idx_first..array.length - 2)
    # this number will be added to the one_combo array
  # add one_combo to combinations
# max_by to sort the combinations by the difference
# return the first array
  # find the difference between each combination, curr_diff
  # if that curr_diff < difference or difference == 0 then difference = curr_diff
# return the combination with the smallest difference

# def closest_numbers(array)
#   combinations = []
#   (0...array.length).each do |idx_first|
#     (idx_first...array.length - 1).each do |idx_second|
#       if array[idx_first] != array[idx_second] 
#         combinations << [array[idx_first], array[idx_second]]
#       end
#     end
#   end
#   combinations.sort_by do |combo|
#     (combo[1] - combo[0]).abs
#   end.first
# end

# second attempt
# find all pairs of numbers passed in as an array
  # first number: index 0 through array length - 2 (idx)
  # second number: first index + 1 
  # array[idx, 2]
  # add each pair to the pairs array
# sort the pairs array by absolute value of the difference
# between the two numbers
# return the first value

def closest_numbers(array)
  pairs = []
  0.upto(array.length - 2) do |idx_first|
    idx_first.upto(array.length - 2) do |idx_last|
      if array[idx_first] != array[idx_last]
        pairs << [array[idx_first], array[idx_last]]
      end
    end
  end
  pairs.sort_by do |arr|
    (arr[0] - arr[1]).abs
  end.first
end

# Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# problem: 
# given a string, return the character that occurs the least often
# if there is a tie, return the character that occurs first in the string

# algorithm:
# downcase the string
# initialize a variable min_char_num to 0
# initialize a variable min_char to ''
# iterate through the distinct characters of the string, curr_char
# count the number of matching characters in the string
  # if min_char_num == 0 or count < min_char_num then 
    # min_char_num = count
    # min_char = character (curr_char)
# return char

# def least_common_char(string)
#   string.downcase!
#   min_char_num = 0
#   min_char = ''
#   string.chars.reverse.uniq do |curr_char|
#     cnt = string.count(curr_char)
#     if min_char_num == 0 || cnt <= min_char_num
#       min_char_num = cnt
#       min_char = curr_char
#     end
#   end
#   min_char
# end


# Examples:
# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'
=end

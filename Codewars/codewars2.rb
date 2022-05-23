# RB109
# codewars2.rb

=begin
# 24. The Hashtag Generator
# (https://www.codewars.com/kata/52449b062fb80683ec000024)
# 5 kyu
# The marketing team is spending way too much time typing in hashtags.
# Let's help them with our own Hashtag Generator!

# Here's the deal:

# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.
# Examples
# " Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
# "    Hello     World   "                  =>  "#HelloWorld"
# ""                                        =>  false

# input: string
# output: string or false

# given a string, append a hashtag at the beginning of the string
# remove all spaces, capitalize the first letter,
# return false if the length of the output string is 0 or greater than 140

# remove all spaces from the string, save to a new variable new_string
# return false if new_string length is 0 or greater than 140
# capitalize the new_string
# add the hashtag at the beginning of new_string


def generateHashtag(string)
  new_string = string.split.map { |word| word.capitalize }.join('')
  return false if new_string.length.zero? || new_string.length > 139
  "#" + new_string
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false

# 25. Pete, the baker
# (https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby)
# 5 kyu
# Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

# Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

# Examples:

# // must return 2
# cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
# // must return 0
# cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 
# =end

# input: two hashes
# output: integer

# given a recipe hash (1st parameter) and a supplies hash (2nd parameter)
# calculate the number of recipes that can be made given the supplies (in whole numbers)

# initialize an array variable multiplier to an empty array
# iterate through each of the required ingredients (hash1)
# check to see if each is included in the supplies list (hash2)
# return 0 if any recipe item is not in the supplies list
# divide the corresponding supplies amount by the recipe amount and round down to a whole integer
# save this integer to the multiplier array
# after iterating through the whole list (and all items are found)
# return the minimum value from the multiplier array

def cakes(recipe, supply)
  multiplier = []
  recipe.each do |ingr, amt|
    if supply.keys.include?(ingr) == false
      return 0
    else
      multiplier << supply[ingr] / recipe[ingr]
    end
  end
  multiplier.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1

# 26. Mean Square Error
# (https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby)
# Complete the function that

# accepts two integer arrays of equal length
# compares the value each member in one array to the corresponding member in the other
# squares the absolute value difference between those two values
# and returns the average of those squared absolute value difference between each member pair.
# Examples
# [1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
# [10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
# [-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

# input: two arrays of integers
# output: float

# given two arrays of the same length which contain integers,
# calculate the difference between values with the same index
# square each value and then return the average

# initialize an array squares
# iterate through each integer in the first hash, using each_with_index
# calculate the difference between the corresponding integers and square each
# save the squares to squares
# sum the values of the squares array and divide by the length of the array
# convert the sum to a float

def solution(arr1, arr2)
  squares = []
  arr1.each_with_index do |int, idx|
    squares << (int - arr2[idx])**2
  end
  (squares.sum.to_f) / squares.length
end

# test cases
p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1

# problem 27
# (https://www.codewars.com/kata/5251f63bdc71af49250002d8)
# 5 kyu

# Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.

# Note: The ** operator has been disabled.

# Examples:

# input: two integers
# output: integer

# given two integers, raise the first to the power of the second
# unless the second integer is negative, in which case, return nil

# utilize the method inject to multiply the first value x number of times
# where x is the second value

def power(int, pwr)
  if pwr.zero?
    1
  elsif pwr < 0
    nil
  else
    arr = Array.new(pwr, int)
    arr.inject(1) { |sum, n| sum * n }
  end
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

# 28. Where are my anagrams
# (https://www.codewars.com/kata/523a86aa4230ebb5420001e1)
# 5 kyu
# What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

# 'abba' & 'baab' == true

# 'abba' & 'bbaa' == true

# 'abba' & 'abbba' == false

# 'abba' & 'abca' == false
# Write a function that will find all the anagrams of a word from a list. You will be given two inputs, a word, and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

# input: string and an array of strings
# output: array of strings

# problem return the strings included in the array that are anagrams
# of the initial string argument

# create a results array []
# create a hash of the word passed in (1st argument)
# iterate through the words in the array, building the hash of each word
# and comparing the hash of the word in the array to the hash of the 
# initial word and if it matches then add it to the results array

def anagrams(word, array)
  results = []
  word_hash = word.chars.group_by { |i| i }
  array.each do |string|
    results << string if string.chars.group_by { |i| i } == word_hash
  end
  results
end

# test cases
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []

# 29. Split Strings
# (https://www.codewars.com/kata/515de9ae9dcfc28eb6000001)
# 6 kyu
# Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

# input: string
# output: array

# problem: split the string into two byte strings
# add an underscore at the end if the string is an odd length

# calculate the length of the string
# if it's odd then append an underscore at the end of the string
# initialize a results array []
# initialize a counter to 0
# start a loop
# copy the first two letters to the results array
# increment the counter by 2
# break out of the loop when the counter equals the length of the string minus 2
# return the results array

def solution(string)
  str_len = string.length
  string = string + '_' if str_len.odd?
  results = []
  counter = 0
  loop do
    break if counter >= str_len
    results << string[counter, 2]
    counter += 2
  end
  results
end

# test cases
p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

# 30. Anagram difference
# (https://www.codewars.com/kata/5b1b27c8f60e99a467000041)
# 6 kyu
# Given two words, how many letters do you have to remove from them to make them anagrams?
# Example
# First word : c od e w ar s (4 letters removed)
# Second word : ha c k er r a nk (6 letters removed)
# Result : 10
# Hints
# A word is an anagram of another word if they have the same letters (usually in a different order).
# Do not worry about case. All inputs will be lowercase.

# input: two strings
# output: integer

# problem 
# given two strings, what is the minimum number of letters that have to be removed
# in order for the resulting strings to be anagrams

# algorithm
# initialize a difference variable to 0
# iterate through the unique characters of the smaller substring
# if the character is not found in the larger substring then 
  # increment the difference variable by the count of the character in the smaller substring
# if the character is found in the larger substring then
  # count the number of that character in both strings
  # increment the difference variable by the difference in count
# iterate through each unique character of the longer string
  # if the character is not found in the smaller substring then
  # increment the difference variable by the count of the character in the larger substring
# return difference variable

def anagram_difference(str1, str2)
  difference = 0
  str_arr = [str1, str2].sort_by { |str| str.length }
  short_str = str_arr.first
  long_str = str_arr.last
  short_str.chars.uniq.each do |char|
    if long_str.include?(char)
      difference += (short_str.count(char) - long_str.count(char)).abs
    else
      difference += short_str.count(char)
    end
  end
  long_str.chars.uniq.each do |long_char|
    unless short_str.include?(long_char)
      difference += long_str.count(long_char)
    end
  end
  difference
end


# test cases
p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

# 31. Anagram Detection
# (https://www.codewars.com/kata/529eef7a9194e0cbc1000255)
# 7 kyu
# An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

# Note: anagrams are case insensitive

# Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

# Examples
# "foefet" is an anagram of "toffee"

# "Buckethead" is an anagram of "DeathCubeK"
# =end

# problem:
# return true if words are anagrams, else false

# algorithm:
# downcase both strings
# iterate through each unique character of str1 and str2
# check to see if the counts of that character are the same 
# between str1 and str2
# if any are not the same then return false
# else return true

def is_anagram(str1, str2)
  str1.downcase!
  str2.downcase!
  (str1 + str2).chars.uniq.all? do |char|
    str1.count(char) == str2.count(char)
  end
end

# test cases
p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false

# 32. Highest Scoring Word
# (https://www.codewars.com/kata/57eb8fcdf670e99d9b000272)
# 6 kyu
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs wabideill be valid.
# =end

# problem:
# find the highest scoring word where the score of each letter is based on the position in the alphabet.

# algorithm:
# create an array of alphabet letters, the index will be the score corresponding with the letter
# use a space for the first letter

# split the string into words, store in an array
# initialize a variable largest_word_sum to 0
# initialize a variable largest_word to ''
# iterate over the words in the array, 
  # initialize a new variable word_sum to 0  
  # iterate over each char of each word, looking up the value of the letter in the alphabet array
  # add the value of the letter to the word_sum
  # after all the character values have been added to word_sum
  # check to see if the value of word_sum > largest_word_sum
    # if it is then set largest_word_sum to word_sum, and set largest_word to the current word
    # if it is not then continue to the next word
# return largest_word

ALPHABET = %w(nil a b c d e f g h i j k l m n o p q r s t u v w x y z)

# def high(string)
#   largest_word_sum = 0
#   largest_word = ''
#   string.split(' ').each do |word|
#     word_sum = calculate_score(word)
#     if word_sum > largest_word_sum
#       largest_word_sum = word_sum
#       largest_word = word
#     end
#   end
#   largest_word
# end

# can I use max_by here?
def high(string)
  string.split(' ').max_by do |word|
    calculate_score(word)
  end
end

def calculate_score(word)
  word_sum = 0
  word.each_char do |char|
    word_sum += ALPHABET.index(char)
  end
  word_sum
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
p high('what time are we climbing up the valcono volcano') == 'valcono'

# 33. Replace With Alphabet Position
# (https://www.codewars.com/kata/546f922b54af40e1e90001da)
# 6 kyu
# In this kata you are required to, given a string, replace every letter with its position in the alphabet.
# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.

# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
# =end

# problem: given a string, return each character's index in the alphabet, 
# return a string of these positions separated by spaces

# algorithm:
# clean up the string:
  # remove non-character values, including spaces, periods, etc. and downcase every letter
# split the cleaned up string into characters in an array
# map each character to the index in the alphabet array
# return the mapped array as a string, separated by spaces

ALPHABET = %w(nil a b c d e f g h i j k l m n o p q r s t u v w x y z)

def alphabet_position(string)
  str_clean = string.downcase.chars.select { |char| char =~ /[a-z]/ }
  str_clean.map { |char| ALPHABET.index(char) }.join(' ')
end


p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

# 34. Sherlock on pockets
# (https://www.codewars.com/kata/53bb1201392478fefc000746)
# 6 kyu
# Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

# Allowed items are defined by array of numbers.

# Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

# pockets = { 
#   bob: [1],
#   tom: [2, 5],
#   jane: [7]
# } 

# Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.
# =end

# problem: 
# given a hash of what items are in each person's pockets and an array of the allowable items,
# return the names of the people which have prohibited items in their pockets

# algorithm
# create a suspects array, []
# iterate through each person in the hash, 
# iterate through each item in the value array, 
  # check to see if all the values in the value array
  # are included in the "allowed" array that was passed in
# if any are included in the hash array that are not in the passed in array,
# then add the key to the suspects array
# return the suspects array

def find_suspects(pockets_hash, allowed_arr)
  suspects = []
  pockets_hash.each do |person, pocket_arr|
    unless pocket_arr.all? { |pocket_item| allowed_arr.include?(pocket_item) }
      suspects << person
    end
  end
  return nil if suspects.length == 0
  suspects
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

# test cases
p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]

# 35. Mexican Wave
# (https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)
# 6 kyu

# In this 
# simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
# Rules
#  	1.  The input string will always be lower case but maybe empty.
# 2.  If the character in the string is whitespace then pass over it as if it was an empty seat.
# =end

# problem:
# given a string, return it x number of times in an array, 
# where x is the length of the string minus any spaces.
# In each string returned uppercase the next letter from the one prior
# In the first string returned, the first letter would be uppercase

# rules/assumptions:
# no need to account for special characters except for spaces
# an empty string returns an empty array
# the input letters are all lowercase

# algorithm:
# break the string up into characters
# initialize a variable results_array
# where x is the length of the string minus spaces
# 'two words'.chars.select { |char| char =~ /[a-z]/ }.length
# set word_counter to 0 (will not increment when a space is found)
# iterate over each character of the string, using each with index (char_index)
  # if the character is a space then next
  # else uppercase the character in the results_array in word_counter index
  # at letter position char_index
# return the results_array

# def wave(string)
#   str_len = string.chars.select { |char| char =~ /[a-z]/ }.length
#   results_array = []
#   (0...string.length).each do |word_idx|
#     new_string = ''
#     string.downcase.chars.each_with_index do |char, char_idx|
#       if word_idx == char_idx
#         new_string << char.upcase
#       else
#         new_string << char
#       end
#     end
#     results_array << new_string
#   end
#   results_array.delete(string)
#   results_array
# end

def wave(string)
  results = []
  (0...string.length).each do |idx|
    new_string = string.downcase
    new_string[idx] = new_string[idx].upcase
    results << new_string
  end
  results.delete(string)
  results
end

# test cases
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

# 36. Delete a Digit
# (https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby)
# 6 kyu
# Task
# Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# Example
# For n = 152, the output should be 52;

# For n = 1001, the output should be 101.

# Input/Output
# [input] integer n

# Constraints: 10 ≤ n ≤ 1000000.

# [output] an integer
# =end

# problem:
# given an integer, return the largest integer that can be formed
# with one digit removed

# algorithm:
# convert the number to a string and parse into chars
# initialize a variable max_num = 0
# remove in turn each digit (0..length of array - 1)
# join remaining digits together, convert to an int
# if curr_num > max_num then max_num = curr_num
# return max_num

# def delete_digit(int)
#   int_arr = int.to_s.chars
#   int_arr_cl = int_arr.clone
#   max_num = 0
#   (0...int_arr.length).each do |dig_idx|
#     int_arr_cl.delete_at(dig_idx)
#     curr_num = int_arr_cl.join.to_i
#     max_num = curr_num if curr_num > max_num
#     int_arr_cl = int_arr.clone
#   end
#   max_num
# end

# p delete_digit(152) == 52
# p delete_digit(1001) == 101
# p delete_digit(10) == 1

# 37. Multiples of 3 or 5
# (https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby)
# 6 kyu
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.
# =end

# problem:
# sum the numbers below the number passed in which are multiples of 3 or 5

# algorithm:
# start with 3, iterate up to the number passed in minus 1
# initialize a variable called sum to 0
# if the number is a multiple or 3 or 5, then add the number to sum
# return the sum

def solution(num)
  sum = 0
  3.upto(num - 1).each do |curr_num|
    if curr_num % 3 == 0 || curr_num % 5 == 0
      sum += curr_num
    end
  end
  sum
end

# test cases
p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

# 38. String transformer
# (https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby)
# 6 kyu
# Given a string, return a new string that has transformed based on the input:

# Change case of every character, ie. lower case to upper case, upper case to lower case.
# Reverse the order of words from the input.
# Note: You will have to handle multiple spaces, and leading/trailing spaces.

# For example:

# "Example Input" ==> "iNPUT eXAMPLE"
# You may assume the input only contain English alphabet and spaces.
# =end

# algorithm:
# initialize a new variable, new_string
# iterate through each character in the string,
# if the character is uppercase then change it to lowercase
# if the character is lowercase then change it to uppercase
# else return the character
# add each character to new_string  
# return new_string

def string_transformer(string)
  new_string = ''
  string.each_char do |char|
    new_char = if char =~ /[A-Z]/
                 char.downcase
               elsif char =~ /[a-z]/
                 char.upcase
               else
                 char
               end
    new_string << new_char
  end
  new_string.split(' ').reverse.join(' ')
end

# test cases
p string_transformer('Example string') #== 'STRING eXAMPLE'

# 39. Largest product in a series
# (https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
# 6 kyu
# Complete the greatest_pProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

# For example:

# greatestProduct("123834539327238239583") // should return 3240
# The input string always has more than five digits.

# problem:
# given a string of integers, return the greatest product of five consecutive digits

# algorithm:
# initialize a variable largest_prod = 0
# convert the string to an array of integers
# iterate through the array, beginning index will go from 
# 0 up to length of the array - 5
# for each iteration:
  # curr_array will start at beginning index and go 5 elements   
  # take the product of the current array
  # if it is larger than largest_product then 
  # largest_prod = curr_prod
# return largest_prod

def greatestProduct(string)
  largest_prod = 0
  str_arr = string.to_i.digits
  0.upto(str_arr.length - 5) do |beg_idx|
    curr_array = str_arr[beg_idx, 5]
    curr_prod = curr_array.inject(:*)
    largest_prod = curr_prod if curr_prod > largest_prod
  end
  largest_prod
end

# test case
p greatestProduct("123834539327238239583") == 3240

# 40. Duplicate Encoder
# (https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby)
# 6 kyu
# The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

# Examples
# "din"      =>  "((("
# "recede"   =>  "()()()"
# "Success"  =>  ")())())"
# "(( @"     =>  "))((" 

# problem: 
# given a string, return a string of parentheses.  An open parenthesis ( will replace
# a character that appears exactly once and a closed parenthesis ) will replace
# a character that appears more than once
# uppercase and lowercase character would be counted as the same character

# algorithm
# initialize a new variable new_string = ''
# assign downcase_string = string
# iterate over each character of downcase_string
# count the number of times that character appears in downcase_string
# if more than once then add ) to new_string
# if once then add ( to new_string
# return new_string

def duplicate_encode(string)
  new_string = ''
  downcase_string = string.downcase
  downcase_string.each_char do |char|
    if downcase_string.count(char) > 1
      new_string << ')'
    else
      new_string << '('
    end
  end
  new_string
end

# test cases
p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

# 41. Backspaces in string
# (https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby)
# 6 kyu
# Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

# Your task is to process a string with "#" symbols.

# Examples
# "abc#d##c"      ==>  "ac"
# "abc##d######"  ==>  ""
# "#######"       ==>  ""
# ""              ==>  ""

# problem: 
# given a string, return a string where characters that are followed by hashes 
# are removed as if the hash were a backspace
# if there are extra hashes, return an empty string
# if an empty string is passed in, return an empty string

# algorithm:
# initialize a new variable, new_string = ''
# iterate through each character in the passed in string
# if the character is not equal to #
  # pass it into new_string
# if the character == # && new_string != ''
  # remove the last character from new_string
# return new_string

def clean_string(string)
  new_string = []
  string.each_char do |char|
    if char != '#'
      new_string << char
    elsif char == '#' && new_string != ''
      new_string.pop
    end
  end
  new_string.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""

# 42. Sort Arrays (Ignoring Case
# (https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby)
# 6 kyu
# Sort the given strings in alphabetical order, case insensitive. For example:

# ["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
# ["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]
# =end

def sortme(array)
  array.sort_by do |str|
    str.downcase
  end
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]

# 43. Transform To Prime
# (https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)
# 6 kyu
# Task :
# Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .

# Notes
# List size is at least 2 .

# List's numbers will only have positives (n > 0) .

# Repetition of numbers in the list could occur .

# The newer list's sum should equal the closest prime number .

# Input >> Output Examples
# 1- minimumNumber ({3,1,2}) ==> return (1)
# Explanation:
# Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .
# 2-  minimumNumber ({2,12,8,4,6}) ==> return (b, 
# 5)
# Explanation:
# Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .
# 3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
# Explanation:

# Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

# problem
# this is essentially asking what is the next prime number above the sum of the numbers
# given an array of integers return the number that when added to the list of numbers
# when the new list of numbers is summed, it will return the closest prime number

# algorithm
# find the sum of the numbers passed in, call that initial_sum
# check to see if the initial_sum is prime
# if it is prime then return 0 
# initialize a variable curr_num to the following:
  # if the number is even then number + 1
  # if odd then increment the number by 2
# check to see if the new number is prime
# if it is then return curr_num - num
# else increment curr_num by 2


# write a method that checks if a number is prime
  # if 1 or 2 => true
  # if even => false
  # iterate from the number / 2 down to 3 - call this curr_denom
  # is the number divisible by curr_denom
  # if yes, then return false
  # if it finishes then return true

def isprime?(num)
  return true if num == 1 || num == 2
  return false if num.even?
  (num / 2).downto(3) do |curr_denom|
    return false if (num % curr_denom).zero?
  end
  true
end

def minimum_number(array)
  initial_sum = array.sum
  return 0 if isprime?(initial_sum)
  initial_sum.even? ? curr_num = initial_sum + 1 : curr_num = initial_sum + 2
  loop do
    return curr_num - initial_sum if isprime?(curr_num)
    curr_num += 2
  end
end

# test cases
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

# 44. Counting Duplicates 
# (https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
# 6 kyu
# Count the number of Duplicates
# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

# Example
# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice
# =end

# problem
# given a string, return a count of the number of distinct characters (either letters or numbers)
# that appear in the string more than once
# if the character is a letter, include the count of both uppercase and lowercase letters

# algorithm
# initialize a results variable to 0
# initialize a str_array variable as an empty array
# find the unique characters
  # iterate through string, adding only characters which are letters or numbers to the array  
  # to the str_array
  # when adding to the str_array, downcase the character
# Call uniq on the array and then iterate over the unique characters
  # count the number of times the character appears in str_array
  # if count > 1 then increment result by 1
# return results

# def duplicate_count(string)
#   results = 0
#   str_array = []
#   string.each_char do |char|
#     if char.downcase =~ /[a-z0-9]/
#       str_array << char.downcase
#     end
#   end
#   str_array.uniq.each do |char|
#     if str_array.count(char) > 1
#       results += 1
#     end
#   end
#   results
# end

# # test cases
# p duplicate_count("") == 0
# p duplicate_count("abcde") == 0
# p duplicate_count("abcdeaa") == 1
# p duplicate_count("abcdeaB") == 2
=end


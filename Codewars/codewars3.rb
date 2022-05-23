# RB109
# codewars3.rb

=begin
# 45. Alphabetized
# (https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
# 6 kyu
# The alphabetized kata
# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Example:

# alphabetized("The Holy Bible") # "BbeehHilloTy"

# problem
# given a string, remove all non-letter characters, order the characters in alphabetical order,
# and return them in a string

# algorithm
# remove non-letter characters from the string
# split into characters and store in an array
# sort the array
# join the array and return

def alphabetized(string)
  cleaned_str = string.gsub(/[^a-zA-Z]/, '')
  cleaned_str.chars.sort_by do |char|
    char.downcase
  end.join
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

# 46. Sum of Digits / Digital Root
# (https://www.codewars.com/kata/541c8630095125aba6000c00/train/ruby)
# 6 kyu
# In this kata, you must create a digital root function.
# A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

# problem
# given an integer, continue to sum the digits until the sum is a single digit number

# algorithm
# initialize the sum_of_digits to number
# start a loop
# split the sum_of_digits into digits
# sum_of_digits = sum of the resulting array
# return sum_of_digits if it is < 10

def digital_root(int)
  sum_of_digits = int
  loop do
    sum_of_digits = sum_of_digits.digits.sum
    return sum_of_digits if sum_of_digits < 10
  end
end


# test cases
p digital_root(5) == 5
p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
# => 1 + 3 + 2 + 1 + 8 + 9
# => 24 ...
# => 2 + 4
# => 6
p digital_root(493193) == 2
# => 4 + 9 + 3 + 1 + 9 + 3
# => 29 ...
# => 2 + 9
# => 11 ...
# => 1 + 1
# => 2
p digital_root(456) == 6

# 47. Array.diff
# (https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby)
# 6 kyu
# Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

# It should remove all values from list a, which are present in list b.

# array_diff([1,2],[1]) == [2]
# If a value is present in b, all of its occurrences must be removed from the other:

# array_diff([1,2],[1]) == [2]

# problem
# remove values from array1 that appear in array2
# if there are dupe values in array1 that match a value in array2 
# then remove all values from array1
# return the resulting array

# algorithm
# duplicate array1 to array1_dup
# find all the unique values in array2, store them in an array, values_to_delete
# iterate over values_to_delete
# deleting each value from array1_dup
# return array1_dup

def array_diff(array1, array2)
  array1_dup = array1.dup
  values_to_delete = array2.uniq
  values_to_delete.each do |num|
    array1_dup.delete(num)
  end
  array1_dup
end

# test cases
p array_diff(array, [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

# 48. Where is my parent!?(cry)
# (https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby )
# Where's my parent?
# 6 kyu
# Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

# Legend:
# -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
# -Function input: String contains only letters, uppercase letters are unique.
# Task:
# Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".
# =end

# problem
# given a string, sort in alphabetical order with capital letters prior to lowercase letters

# algorithm
# sort the string normally (all uppercase will be prior to lowercase)
# sort_by downcase which should keep the uppercase prior to the lowercase

def find_children(string)
  string.chars.sort.sort_by { |char| char.downcase }.join
end

# test cases
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

# 49. Playing with digits
# (https://www.codewars.com/kata/5552101f47fc5178b1000050/train/ruby)
# 6 kyu
# Some numbers have funny properties. For example:

# 89 --> 8¹ + 9² = 89 * 1

# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

# we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.
# In other words:

# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

# If it is the case we will return k, if not return -1.

#   Note: n and p will always be given as strictly positive integers.
  
#   dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
#   dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
#   dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
#   dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# problem
# given two integers, the first is n, the target integer,
# the second is p the starting exponent
# split the integer n into digits, raise each digit to a consecutive integer starting with p,
# sum together, if the result is able to be divided by another integer k without a remainder
# then return the integer k

# rules
# if an integer k is not found then return -1

# high level algorithm
# split the number n into digits (array)
# raise each digit to an exponent starting with p and incrementing by 1
# sum the results together
# check to see if the result is divisible by n evenly (no remainder)
  # if so then return the resulting number after the division
  # if not then return -1

# low level algorithm
# split the number n into digits (array)
# initialize a variable exponent = p
# iterate over each number in the array, raising each digit to the exponent variable
# Increment p by 1
# sum the results together, save to result variable
# check to see if the result is divisible by n evenly (no remainder)
  # if so then return the resulting number after the division
  # if not then return -1

def dig_pow(n, p)
  exponent = p - 1
  sum_of_digits = n.digits.reverse.reduce(0) do |sum, digit|
             exponent += 1
             sum + digit ** exponent
  end
  result, remain = sum_of_digits.divmod(n)
  return result if remain == 0
  -1
end


# test cases
p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2

# 50. Equal Sides Of An Array
# (https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby)
# Equal sides of an array
# 6 kyu
# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

# For example:

# Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

# Let's look at another one.
# You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

# Last one:
# You are given the array {20,10,-80,10,10,15,35}
# At index 0 the left side is {}
# The right side is {10,-80,10,10,15,35}
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal.

# Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

# Input:
# An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

# Output:
# The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

# Note:
# If you are given an array with multiple answers, return the lowest correct index.
# =end

# problem:
# given an array of integers, find the index N where the sum of the integers to the left of index N (not including index N)
# equals the sum of the integers to the right of index N (not including index N)

# rules:
# index N can be 0 or the last index because an empty array evaluates to 0 in this problem's context (so long as the other elements sum to 0)
# if an index N can't be found then return -1
# if multiple indices meet this criteria then return the lowest index

# high level algorithm
# iterate through the array element by element, keeping track of the index
# check to see if the sum of the elements to the left of the index equals the sum of the elements to the right of the index
# if they equal then return the index
# else continue
# if nothing is returned and all elements have been checked then return -1

# low level algorithm
# iterate through the array element by element, keeping track of the index (each with index)
  # elem will be number we are iterating on, index will be the index of that element
# check to see if the sum of the elements to the left of the index equals the sum of the elements to the right of the index
  # left: array[0, index]
  # right: array[index + 1, array.length - 1 - index]
  # left == right?
    # if they equal then return the index
# if nothing is returned and all elements have been checked then return -1

def find_even_index(array)
  array.each_with_index do |_, index|
    left = array[0, index].sum
    right = array[(index + 1), (array.length - 1 - index)].sum
    return index if left == right
  end
  -1
end

# test cases
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1

# 51. Reverse or rotate?
# (https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991)
# 6 kyu
# Reverse or rotate?
# The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

# If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

# If sz is <= 0 or if str is empty return ""
# sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

# Examples:
# revrot("123456987654", 6) --> "234561876549"
# revrot("123456987653", 6) --> "234561356789"
# revrot("66443875", 4) --> "44668753"
# revrot("66443875", 8) --> "64438756"
# revrot("664438769", 8) --> "67834466"
# revrot("123456779", 8) --> "23456771"
# revrot("", 8) --> ""
# revrot("123456779", 0) --> "" 
# revrot("563000655734469485", 4) --> "0365065073456944"

# problem:
# input: string and an integer
# output: string

# break down the string of integers into the size specified (2nd argument)
# if there are extra digits after breaking down the string then ignore these digits
# check to see if the substring when broken down into digits and each digit is cubed
# and all results are summed is divisible by 2, if so then reverse the substring digits, 
# otherwise rotate the digits to the left, moving the first digit to the end
# do this for all substrings that were found
# concatenate the resulting substrings together

# rules:
# if 0 is passed in as the 2nd argument, return empty string
# if an empty string is passed in as the 1st argument, return empty string

# high level algorithm
# break down the string into chunks of size n (n is 2nd argument)
# iterate over each string
  # break the string into digits, cube each, and sum
  # check if divisible by 2
    # if so, then reverse
    # else, rotate
# concatenate resulting strings together and return

# low level algorithm
# break down the string into chunks of size n (n is 2nd argument)
  # initialize a variable substrings = []
  # counter = 0
  # loop
    # break if counter + n > string.length
    # substrings << string[counter, n]
    # counter += n
  #end
# iterate over each substring
  # result = break the substring into digits, cube each, and sum
  # check if result divisible by 2
    # if so, then reverse
    # else, rotate
      # substring[0..-2], substring[-1] = substring[1..-1], substring[0]
# concatenate resulting strings together and return as a string

def rotate(string)
  return string if string.length == 0
  string[0..-2], string[-1] = string[1..-1], string[0]
  string
end

def revrot(string, n)
  return "" if n == 0 || string == ""
  substrings = []
  counter = 0

  loop do
    break if counter + n > string.length
    substrings << string[counter, n]
    counter += n
  end

  substrings.map! do |substr|
    substr_sum = substr.to_i.digits.inject(0) do |sum, digit|
                   sum + digit ** 3
                 end
    substr_sum.even? ? substr.reverse : rotate(substr)
  end
  substrings.join
end

# test cases
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"

# 521. Decipher this!    
# https://www.codewars.com/kata/581e014b55f2c52bb00000f8
# Decipher this!
# 6 kyu
# You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

# For each word:

# the second and the last letter is switched (e.g. Hello becomes Holle)
# the first letter is replaced by its character code (e.g. H becomes 72)
# Note: there are no special characters used, only letters and spaces

# Examples

# decipherThis('72olle 103doo 100ya'); // 'Hello good day'
# decipherThis('82yade 115te 103o'); // 'Ready set go'
# =end

# problem:
# input: string
# output: string

# given an encoded string decode it using the following rules:
# first letter of each word has been replaced with its ASCII code
# second and last letters of each word have been swapped

# high level algorithm:
# split the string into words
# iterate over each word
  # replace the leading number with its corresponding letter
  # swap the second and last letters
# join the resulting words together with a space in between and return the string

# low level algorithm:
# split the string into words
# iterate over each word (map)
  # partition the numbers from the letters  
  # replace the leading number with its corresponding letter
    # assign this to first_letter: partition array 1 (numbers) - join, convert to integer, convert to ascii
  # swap the second and last letters
    # assign this to last_letters: partition array 2 (letters) - parray2[0], parray2[-1] = parray2[-1], parray2[0]
    # parray2 join
  # combine first_letter and last_letters
# join the resulting words together with a space in between and return the string

def decipher_this(string)
  result_arr = string.split.map do |word|
                part_array = word.chars.partition { |char| char =~ /[0-9]/ }
                first_letter = part_array[0].join.to_i.chr
                part_array[1][0], part_array[1][-1] = part_array[1][-1], part_array[1][0]
                last_letters = part_array[1].join
                first_letter + last_letters
  end
  result_arr.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

# 532. Bouncing Balls2
# (https://www.codewars.com/kata/5544c7a5cb454edb3c000047)
# 6 kyu
# A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.

# He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

# His mother looks out of a window 1.5 meters from the ground.

# How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

# Three conditions must be met for a valid experiment:
# Float parameter "h" in meters must be greater than 0
# Float parameter "bounce" must be greater than 0 and less than 1
# Float parameter "window" must be less than h.
# If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

# Note:
# The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

# Example:
# - h = 3, bounce = 0.66, window = 1.5, result is 3

# - h = 3, bounce = 1, window = 1.5, result is -1 
# (Condition 2) not fulfilled).
# =end

# problem:
# given the height ball is dropped, rebound percentage, and height of sightline,
# return the number of times the ball will be seen from the sightline

# high level algorithm:
# check 3 conditions, return -1 if any are met
# else continue
# set bounces to 1 (ball falling initially)
# start a loop
# calculate next_height = height * bounce
# check if greater than window
  # if yes, then 
    # set height to next_height  
    # add two to the count
  # if no, then return bounces
# end loop

# low level algorithm:
# return -1 if any of these conditions are met:
  # Float parameter "h" in meters must be greater than 0
  # Float parameter "bounce" must be greater than 0 and less than 1
  # Float parameter "window" must be less than h.
# set num_bounces to 1 (ball falling initially)
# start a loop
# calculate next_height = height * bounce
# check if greater than window
  # if yes, then 
    # set height to next_height  
    # add two to num_bounces
  # if no, then return num_bounces
# end loop

def bouncingBall(h, bounce, window)
  return -1 if h <= 0 || bounce <= 0 || bounce >= 1 || window >= h
  num_bounces = 1
  height = h
  loop do
    next_height = height * bounce
    break if next_height <= window
    height = next_height
    num_bounces += 2
  end
  num_bounces
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1

# 543. WeIrD StRiNg CaSe
# (https://www.codewars.com/kata/52b757663a95b11b3d00062d) 
# 6 kyu
# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.

# The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').


# problem:
# given a string, return a string with every even character uppercase and 
# every odd character lowercase
# spaces will count as an index

# high level algorithm:
# iterate through each character in the string
# if the index is even, change the character to uppercase
# if the index is odd, change the character to lowercase

# low level algorithm:
# initialize a new variable new_string
# iterate through each character in the string
  # char - represent the character
  # index - represent the index
# if the index is even, change the character to uppercase
  # index.even? then char.upcase
# if the index is odd, change the character to lowercase
  # char.downcase

def weirdcase(string)
  new_string = ''
  string.chars.each_with_index do |char, index|
    index.even? ? new_string << char.upcase : new_string << char.downcase
  end
  new_string
end

# test cases
p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg cAsE"

# 55. Are they the "same"?
# (https://www.codewars.com/kata/550498447451fbbd7600041c)
# 6 kyu
# Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.
# Examples
# Valid arrays
# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
# Invalid arrays
# If we change the first number to something else, comp may not return true anymore:

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
# comp(a,b) returns false because in b 132 is not the square of any number of a.

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
# comp(a,b) returns false because in b 36100 is not the square of any number of a.

# Remarks
# a or b might be [] (all languages except R, Shell).
# a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).
# If a or b are nil (or null or None), the problem doesn't make sense so return false.

# Note for C
# The two arrays have the same size (> 0) given as parameter in function comp.
# =end

# problem:
# given two arrays
# check to see if all the integers in array 1, when squared, are present in array 2
# if all numbers appear in array 2 then return true
# else return false

# high level algorithm
# square all values in array 1
# sort array1 and array2
# check to see if they match
# if they match then true
# else false

def comp(array1, array2)
  return false if array1 == nil || array2 == nil
  array1.map { |num| num ** 2 }.sort == array2.sort
end

# test cases
p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false

# 56. Grouping and Counting
# (https://www.codewars.com/kata/53a452dd0064085711001205)
# 6 kyu
# Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

# Example usage:

# input = [1,1,2,2,2,3]

# group_and_count(input)# == {1=>2, 2=>3, 3=>1}
# The following methods were disabled:

# Array#count
# Array#length
# =end

# problem: 
# given an array, return a hash of all the unique elements as keys
# and the count of each element as the value
# if an empty array or nil is passed in then return nil

# high level algorithm
# return nil if array is empty or equal to nil
# initialize a hash, results = {}
# iterate through the unique elements of the array
# add to the results hash as a new key with the value equal to 
# the count of that element in the array
# return the results hash

def group_and_count(array)
  return nil if array == [] || array == nil
  results = {}

  array.uniq.each do |key|
    results[key] = array.count(key)
  end
  results
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

# 57. Find the Nexus of the Codewars Universe
# (https://www.codewars.com/kata/5453dce502949307cf000bff)
# 6 kyu

# Not to brag, but I recently became the nexus of the Codewars universe! My honor and my rank were the same number. I cried a little.

# Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

# If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

# Example
#          rank    honor
# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,    <--- nexus
#           23  =>  11,
#           30  =>   2 }
# =end

# problem:
# given a hash with users as key/value pairs, where the key is the rank
# and the value is the user's honor, return the rank of the user (key) which is
# closest in value to the honor.
# If there are multiple users with the same difference between rank and honor,
# then return the smallest rank

# high level algorithm
# sort the hash by keys
# iterate through the sorted hash
# calculate the absolute value of the difference between the key and the value
# return the key with the smallest difference

# low level algorithm
# sort the hash by keys
# initialize two variables: difference = 0, rank = 0
# iterate through the sorted hash (curr_rank, honor)
# calculate the difference, curr_diff
  # if curr_diff < difference || rank.zero?
    # difference = curr_diff
    # rank = curr_rank
# when finished with all key/value pairs, return rank

def nexus(hash)
  difference = 0
  rank = 0
  hash.sort.to_h.each do |curr_rank, honor|
    curr_diff = (curr_rank - honor).abs
    if curr_diff < difference || rank.zero?
      difference = curr_diff
      rank = curr_rank
    end
  end
  rank
end


p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2

# 58. Count letters in string
# (https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d)
# 6 kyu
# In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.
# =end

# problem:
# given a string, return a hash with the unique lowercase letters as keys 
# and the count of each lowercase letter as the value
# the keys must be symbols instead of strings

# high level algorithm:
# create an array that only includes the lowercase letters
# create an array with all the unique lowercase letters
# initialize a hash called results = {}
# iterate through the unique lowercase letters array
# add each letter to the hash as a key and the value will be the count of that letter
# in the lowercase letters array
# return results array

def letter_count(string)
  all_lowers = string.chars.select { |char| char =~ /[a-z]/ }
  results = {}

  all_lowers.uniq.each do |char|
    results[char.to_sym] = all_lowers.count(char)
  end
  results
end


p letter_count('arithmetics') ==  {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('Arithmetics') ==  {:c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# 598. Triple trouble
# (https://www.codewars.com/kata/55d5434f269c0c3f1b000058)
# 6 kyu
# Write a function

# triple_double(num1, num2)
# which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

# If this isn't the case, return 0

# Examples
# triple_double(451999277, 41177722899) == 1
# # num1 has straight triple 999s and  num2 has straight double 99s

# triple_double(1222345, 12345) == 0
# # num1 has straight triple 2s but num2 has only a single 2

# problem:
# given two integers, check to see if the first integer has three of the same digit repeated consecutively
# and if one is found then check to see if the second integer has two of the same digit repeated consecutively
# If both conditions are met then return 1, else return 0

# high level algorithm:
# split the first number into digits, filter so that only the unique digits appear
# store as an array
# iterate through each unique digit
# check to see if that digit is repeated 3 times in the first integer
# and 2 times in the second integer
# if it is then return 1
# if all integers have been checked then return 0

# low level algorithm:
# split the first number into characters, filter so that only the unique digits appear
# store as an array - uniq_digits (strings)
# save the two passed in integers as strings, int1_str, int2_str
# iterate through each element in unique digit
  # if both are true return 1
  # check to see if int1_str includes digit * 3
  # check to see if int2_str includes digit * 2
# return 0

def triple_double(int1, int2)
  uniq_digits = int1.to_s.chars.uniq
  int1_str = int1.to_s
  int2_str = int2.to_s

  uniq_digits.each do |digit|
    if int1_str.include?(digit * 3) && int2_str.include?(digit * 2)
      return 1
    end
  end
  0
end

# test cases
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1

# 60. Which are in?
# (https://www.codwewars.com/kata/550554fd08b86f84fe000a58)
# 6 kyu
# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

# #Example 1: a1 = ["arp", "live", "strong"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns ["arp", "live", "strong"]

# #Example 2: a1 = ["tarp", "mice", "bull"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns []

# Notes:
# Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

# In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

# Beware: r must be without duplicates.
# Don't mutate the inputs.

# problem:
# given two arrays of strings, return the strings in array 1 that are substrings of any of the
# strings in array 2
# return as a sorted array with duplicates removed

# high level algorithm:
# iterate through all the strings of the first array
# check to see if that string is contained within any of the strings in array 2
# if it is then add it to a results array
# sort the results array, remove duplicates, and return

# low level algorithm:
# initialize a results array
# iterate through all the strings of the first array
# check to see if the string from array 1 is included in each string of array 2
# if there is at least one match add string to results array
# sort and dedupe results array
# return sorted and deduped array

def substrings(array1, array2)
  results = array1.select do |str1|
              array2.any? do |str2|
                str2.include?(str1)
              end
            end
  results.sort.uniq
end

# test cases
p substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
p substrings(["delta", "gamma", "alpha", "beta"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == ["alpha", "beta", "gamma"]
p substrings(["albe", "negam"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == []
=end
# RB109
# Pass by Reference Studying
# greeting = 'Hello'
# p greeting
# => "Hello"
# >> whazzup = greeting
# => "Hello"
# >> greeting.upcase!
# => "HELLO"
# >> greeting
# => "HELLO"
# >> whazzup
# => "HELLO"

# # variable reassignment
# >> greeting = 'Dude!'
# => "Dude!"
# >> puts greeting
# => "Dude!"
# >> puts whazzup
# => "HELLO!"

# number = 3
# => 3
# p number
# => 3
# p number.object_id
# => 7
# number = 2 * number
# => 6
# p number
# => 6
# p number.object_id
# => 13

# greeting = 'Dude'
# salutation = 'Hello'

# def plus(x, y)
#   x = x + y
# end
# a = "hello"
# b = plus(a, "world")
# puts a # 3
# puts b # 5

# hash = { apple: 0, cinnamon: 0, dish_detergent: 0, rice: 0 }
# array = [ 'apple', 'dish_detergent', 'mango' ]

# array.each do |item|
#   item_sym = item.to_sym
#   if hash.include?(item_sym)
#     puts "#{hash[item_sym]}"
#     hash[item_sym] += 1
#   end
# end

# statement = "The Flintstones Rock"

# array = statement.chars.uniq
# array.delete(" ")

# hash = {}

# array.each do |letter|
#   num_letters = statement.count(letter)
#   hash[letter] = num_letters
# end

# p hash

# words = "the flintstones rock"

# p words.split.map { |word| word.capitalize }.join(" ")

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# age_group
# Note: a kid is in the age range 0 - 17, 
# an adult is in the range 18 - 64 
# and a senior is aged 65+.


# new_hash = munsters.each do |_, hash|
#   case hash["age"]
#   when 0...18
#     hash["age_group"] = 'kid'
#   when 19...64
#     hash["age_group"] = 'adult'
#   else
#     hash["age_group"] = 'senior'
#   end
# end

# p new_hash


# def star_method(stars)
#   for star in stars
#     star.downcase
#   end
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# stars_2 = star_method(stars_1)


# mailing_campaign_leads = [
#   {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
#   {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
#   {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
#   {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
# ]

# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   names.map! { |name| name.capitalize }
#   lead[:name] = names.join(' ')
# end

# p mailing_campaign_leads

# def test(b)
#   b.map! {|letter| "I like the letter: #{letter}"}
# end

# a = ['a', 'b', 'c']
# p test(a)
# p a

# my_arr = [[18, 7], [3, 12]].select do |arr|
#   arr.all? { |num| num > 5 }
# end
 
# p my_arr

# arr = ['10', '11', '9', '7', '8']

# p arr.sort_by { |a, b| (b.to_i) <=> (a.to_i) }
# p arr.sort_by { |a, b| b <=> a }

# arr = ['fire', 'fir']
# p arr.sort

# a = 2
# b = [5, 8]
# arr = [a, b]

# arr[0] += 2
# arr[1][0] += 2
# p a
# p b
# p arr

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# vowels = 'aeiou'

# hsh.each do |_,array|
#   array.each do |word|
#     word.chars.each do |letter|
#       puts letter if vowels.include?(letter)
#     end
#   end
# end

# def change_name(name)
#   name = 'bob'      # does this reassignment change the object outside the method?
# end

# name = 'jim'
# puts change_name(name)
# puts name       

# arr1 = ["a", "b", "c"]
# arr2 = arr1.dup
# arr2.map! do |char| 
#   char.upcase
# end
# p arr1  
# p arr2

# def name
#   "George"
# end

# name = "Lisa"

# def display_name
#   puts name
# end

# display_name

# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []

#   strings.each do |string|
#     lengths << string.size
#   end
#   lengths
# end

# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   counter = 1

#   until counter == strings.size do
#     word_length = strings[counter - 1].length
#     lengths.push(word_length)
#     counter += 1
#   end

#   lengths
# end

# sent = 'To be or not to be'
# p string_lengths(sent)

# What does the following code return? What does it output? Why? What concept does it demonstrate?
# The following code returns nil (since that is what is returned when p is invoked).
# The following code outputs ['a','-','c'] because in line 2 the array index 1 is now pointing to the 
# object '-' instead of 'b'
# This demonstrates that variables 
# a = %w(a b c)
# a[1] = '-'
# p a



# def add_name(arr, name)
#   arr = arr + [name]
# end

# endnames = ['bob', 'kim']
# add_name(names, 'jim')
# puts names

# a = 4

# loop do
#   a = 5 
#   b = 3

#   break
# end

# puts a
# puts b

# a = 4
# b = 22.times do |a|  
#   a = 5  
#   puts a
# end
# puts a
# puts b

# a = ['a', 'b', 'c']

# c = a.each do |b|
#   b.upcase!
#   a = ['reassign']
# end

# p a
# p c

# a = [1, 2, 3]

# a.object_id # => 1960

# a.map do |a| 
#   p a.object_id
#   a + 1
# end # 3

# p a

# def fix(value)  
#   puts "The object ID of value before upcase is #{value.object_id}"
#   value = value.upcase  
#   puts "The object ID of value after upcase is #{value.object_id}"
#   value.concat('!')
# end

# s = 'hello'
# t = fix(s)

# p s
# p t


# def fix(value)  
#   puts "The object ID of value before mutation is #{value.object_id}"
#   value = value.upcase!  
#   puts "The object ID of value after mutation is #{value.object_id}"
#   value.concat('!')
# end

# s = 'hello'
# puts "The object ID of s prior to fix method is #{s.object_id}"
# t = fix(s)
# p s
# puts "The object ID of s after the fix method is #{s.object_id}"
# p t
# puts "The object ID of t is #{s.object_id}"

# def test  
#   puts "written assessment"
# end

# var = test
# if var  
#   puts "written assessment"
# else  
#   puts "interview"
# end

# { a: "ant", b: "bear", c: "cat" }.any? do |key, value|  
#   value.size > 4
# end
  
# a = 4 
# b = 2 

# loop do  
#   c = 3  
#   a = c  
#   break 
# end 

# puts a 
# puts b

# def method
#   a = 5.2
#   b = 7.3
#   a = b
#   b += 1.1
# end

# p method

# p a
# p b

# def fix(value) 
#   value[1] = 'x' 
#   value 
# end

# s = 'abc'
# t = fix(s)

# p s
# p t

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# puts "This is the original object ID #{arr.object_id}."
# new_array = arr.select do |n|
#   n + 1
# end
# p new_array
# puts "This is the new object ID #{new_array.object_id}."

# a = "Hello"
# if a  
#   puts "Hello is truthy"
# else  
#   puts "Hello is falsey"
# end

# animal = "dog"
# loop do |a|  
#   animal = "cat"  
#   break
# end
# puts animal

# a = [1, 2, 3, 3]
# b = a
# c = a.uniq!

# p a
# p b
# p c

# def test(str)  
#   str  += '!'  
#   str.downcase!
# end
# test_str = 'Written Assessment'
# p test(test_str)
# puts test_str

# def fix(value)  
#   value << 'xyz'  
#   value = value.upcase  
#   value.concat('!')
# end
# s = 'hello'
# t = fix(s)

# p s
# p t

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# new_array = arr.select do |n|   
#   n + 1  
#   puts n
# end
# p new_array

# words = %w(jump trip laugh run talk)
# new_array = words.map do |word|  
#   word.start_with?("t")
# end
# p new_array

# [1, 2, 3].any? do |num|  
#   num > 1
# end

# def star_method(stars)
#   for star in stars
#     star.downcase
#   end
# end

# stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
# stars_2 = star_method(stars_1)
# p stars_2

# a = 'hi'
# english_greetings = ['hello', a, 'good morning']

# greetings = {
#   french: ['bonjour', 'salut', 'allo'],
#   english: english_greetings,
#   italian: ['buongiorno', 'buonasera', 'ciao']
# }

# greetings[:english][1] = 'hey'
# p a
# p greetings
# p english_greetings

# order_data = [
#   {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
#   {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
#   {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
#   {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
#   {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65}
# ]

# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   },
#   {
#     customer_id: 32,
#     customer_name: 'Michael Richards',
#     orders: [
#       { order_fulfilled: true, order_value: 120.00 },
#       { order_fulfilled: false, order_value: 85.65 }
#     ]
#   }
# ]

# all_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end

# customer_orders.each_with_index do |data, index|
#   order_value = data[:orders].reduce(0) do |total, order|
#     total + order[:order_value]
#   end

#   all_orders[index][:total_order_value] = order_value
# end

# all_orders = []

# customer_orders.each do |customer_data|
#   customer_total_orders = {
#     customer_id: customer_data[:customer_id],
#     customer_name: customer_data[:customer_name],
#     total_order_value: 0
#   }

#   customer_data[:orders].each do |order|
#     customer_total_orders[:total_order_value] += order[:order_value]
#   end

#   all_orders << customer_total_orders
# end

# p all_orders

# fulfilled_orders = customer_orders.map do |customer|
#   {
#     customer_id: customer[:customer_id],
#     customer_name: customer[:customer_name]
#   }
# end

# customer_orders.each_with_index do |data, index|
#   order_value = data[:orders].reduce(0) do |total, order|
#     if order[:order_fulfilled]
#       total + order[:order_value]
#     else
#       total
#     end
#   end

#   fulfilled_orders[index][:order_value] = order_value
# end

# p fulfilled_orders

# all_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
#   {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65}
# ]

# fulfilled_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
#   {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00}
# ]

# a = 2
# b = [5, 8]
# arr = [a, b]
# p arr # => [2, [5, 8]]
# arr[0] += 2 # This is updating the array, NOT a
# p arr # => [4, [5, 8]]
# p a # => 2
# arr[1][0] -= a
# p arr # => [4, [3, 8]]
# p b # => [3, 8]

# def add_name(arr, name)  
#   puts "arr.object ID is #{arr.object_id} before the reassignment"
#   arr = arr << name
#   puts "arr.object ID is #{arr.object_id} after the reassignment"
#   end

# names = ['bob', 'kim']
# puts "names.object ID is #{names.object_id} before the reassignment"
# add_name(names, 'jim')
# puts names
# puts "names.object ID is #{names.object_id} after the reassignment"

# object = "coal"

# 2.times do |object|  
#   puts object
#   object = "diamonds"  
# 	puts object
# end

# puts object

# foo = "no"

# def foo(param = "no")
#   "yes"
# end

# def bar(param = "no")
#   param == "no" ? "yes" : "no"
# end

# p bar(foo)

# i = 10
# loop do
# i -= 1
# break i if i == 0
# end

# for i in (1..3) do
#   j = 'my favorite number is'
#   puts "#{j} #{i}"
# end

# p j
# p i

# def test  
#   puts "written assessment"
# end

# var = test
# if var  
#   puts "written assessment"
# else  
#   puts "interview"
# end

# a = %w(a b c)
# p a.object_id
# p a[1].object_id
# a[1] = '-'
# p a
# p a.object_id
# p a[1].object_id

# arr = [1, 2, 3, 4]
# counter = 0
# sum = 0

# loop do  
#   sum += arr[counter]  
#   counter += 1  
#   break if counter == arr.size
# end 

# puts "Your total is #{sum}"

# a = "hello"
# b = a
# c = a
# c << " world"
# a += " world"


# puts a # => "hello world"
# puts b # => "hello world"

# my_hash = {a: [1, 2], b: [3, 4], c: [5, 6]}

# new_hash = my_hash.each do |letter, arr|
#   arr.each do |num|
#     puts num + 1
#   end
# end

# p new_hash

# def repeated_substring_pattern(string)
#   substrings = []
#   1.upto(string.size / 2) do |num|
#     if (string.size % num == 0)
#       substrings << string[0, num]
#     end
#   end

#   substrings.each do |substring|
#     multiplier = string.size / substring.size

# problem from watch others code video 2
# problem: given an integer find the next highest number 
# with the same digits as the input number
# -1 if there is no greater number that meets the criteria

# input: integer
# output: integer

# algorithm:
# starting with the input integer plus 1,
# check to see if the test number contains the digits of the input integer
# increment the test number and keep testing until either:
# a match to the number is found (return this number)
# -or-
# a max value has been reached
# if the max value is reached then return -1
# the max value will be calculated as follows:
# the length of the integer (after converting to a string)
# 10 ^ length of the integer
# ex: 9 => max iteration will be 10
# ex: 12 => max iteration will be 10**2 = 100
# ex: 513 => max iteration will be 10**3 = 1000
# how to check if a number has the same digits as the input number?
# input number's individual digits will be stored as an array
# ex: 513 => [5, 1, 3]
# iterate through the test number (514) by using all? and include?


# def next_bigger_number(int)
#   max_num = int.to_s.chars.sort.reverse.join.to_i
#   (int + 1).upto(max_num) do |test_num|
#     result = test_num.to_s.chars.sort == int.to_s.chars.sort
#     return test_num if result
#   end
#   -1
# end

# # test cases
# p next_bigger_number(9) == -1
# p next_bigger_number(12) == 21
# p next_bigger_number(513) == 531
# p next_bigger_number(2017) == 2071
# p next_bigger_number(111) == -1
# p next_bigger_number(531) == -1
# p next_bigger_number(123456789) == 123456798

# check to see if a substring is contained in two passed in strings
# substring must be at least two characters long

# algorithm
# find the smaller string
# iterate from 0 to length of the string - 2 (index1)
# iterate from index1 + 1 to length of the string - 1 (index2)
# find the first iteration and check to see if the other string includes this substring
# if not then move on to the next iteration
# if a match is found then return true
# if a match is not found after all substrings have been checked then return false

# def substring_test(str1, str2)
#   sorted_str = [str1, str2].sort_by { |str| str.length }
#   short_str = sorted_str.first.downcase
#   long_str = sorted_str.last.downcase
#   0.upto(short_str.length - 2) do |idx1|
#     (idx1 + 1).upto(short_str.length - 1) do |idx2|
#       return true if long_str.include?(short_str[idx1..idx2])
#     end
#   end
#   false
# end

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('test','lllt') == false

# problem: given two strings, str1 and str2, check to see if str1 
# contains all the same letters as str2

# algorithm:
# iterate through str2, character by character
# check to see if str1 includes that character
  # if str1 does include the character then substitute '' for the character
  # if it does not then return false
# if iteration completes then return true

# def scramble(str1, str2)
#   str2.each_char do |char|
#     if str1.include?(char)
#       str1.sub!(char, '')
#     else
#       return false
#     end
#   end
#   true
# end

# using count
# def scramble(str1, str2)
#   str2_hash = {}
#   str2.chars.uniq.each do |char2|
#     letter_count = str2.count(char2)
#     str2_hash[char2] ? str2_hash[char2] += letter_count : str2_hash[char2] = letter_count
#   end
#   p str2_hash
#   str2_hash.each do |letter, count|
#     return false if str1.count(letter) < count
#   end
#   true
# end

# another way using count
# def scramble(str1, str2)
#   str2.chars.uniq.each do |char2|
#     return false if str1.count(char2) < str2.count(char2)
#   end
#   true
# end

# # test cases
# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false

# problem: 
# given a string, return the length of the longest palindrome

# input: string
# output: integer

# algorithm
# results = 0
# create a list of all the substrings of the string
  # idx1 will start from 0 and go until the length of the string - 1
  # idx2 will start from idx1 and go until the length of the string - 1
  # add the substring that starts at idx1 and ends at idx2 to the substring array
# iterate through the substring list, checking to see if each is a palindrome.
# if it is a palindrome then take the length of the string and save it 
# to the results variable if it is greater than results
# return results

# def longest_palindrome(string)
#   results = 0
#   substr_arr = []
#   (0...string.length).each do |idx1|
#     (idx1...string.length).each do |idx2|
#       substr_arr << string[idx1..idx2]
#     end
#   end
#   substr_arr.each do |substr|
#     if substr == substr.reverse
#       if substr.length > results
#         results = substr.length
#       end
#     end
#   end
#   results
# end

# # test cases
# p longest_palindrome("a") == 1
# p longest_palindrome("aa") == 2
# p longest_palindrome("baa") == 2
# p longest_palindrome("aab") == 2
# p longest_palindrome("baabcd") == 4
# p longest_palindrome("baablkj12345432133d") == 9
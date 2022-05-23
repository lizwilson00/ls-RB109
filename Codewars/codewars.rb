# RB109
# Codewars problems
# codewars.rb

=begin
# 1 count lower case letters
LOWER_LETTERS = ('a'..'z').to_a

def letter_count(str)
  letter_hash = {}
  str.each_char do |letter|
    next if LOWER_LETTERS.none?(letter)
    letter_sym = letter.to_sym
    letter_hash[letter_sym] ? letter_hash[letter_sym] += 1 : letter_hash[letter_sym] = 1
  end
  letter_hash
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('cOdewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# 2 count pairs
def arr_to_hash(arr)
  num_hash = {}
  arr.each do |num|
    num_hash.key?(num) ? num_hash[num] += 1 : num_hash[num] = 1
  end
  num_hash
end

def pairs(arr)
  total_pairs = 0
  num_hash = arr_to_hash(arr)
  num_hash.each do |_, value|
    total_pairs += value / 2
  end
  total_pairs
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

# 3 Return substring instance count
# Complete the solution so that it returns the number of times the search_text is found within the full_text.

# input: two strings, one is the string we will perform our search on, other is the search string
# output: integer

# Restating the problem: Return the number of times that the search string (2nd string) is found within the passed in string (1st string)

# Create an array of substrings from the 1st string that are the same length as the search string
# allow duplicate substrings
# Count the substrings that match the search string 

# how to create the array of substrings
# for a two letter search string: [0, 1], [1, 2], [2, 3], etc.
# for a three letter search string: [0, 1, 2], [1, 2, 3], [2, 3, 4], etc.

def solution(target_str, search_str)
  target_subarr = []
  search_len = search_str.length
  0.upto(target_str.length - search_len) do |index|
    target_subarr << target_str[index, search_len]
  end
  target_subarr.select { |substr| substr == search_str }.length
end

# Usage example:

# solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
# solution('aaabbbcccc', 'bbb') # should return 1
# solution('aaabbbcccc', 'ddd') # should return 0

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('abbc', 'd') == 0

# 4 Alphabet symmetry
# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

# solve(["abode","ABc","xyzD"]) = [4, 3, 1]
# See test cases for more examples.

# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

# input: array of strings
# output: array of integers

# problem: count the number of characters in each string that fall in the same position as it does in the full alphabet
# create an array of alphabet characters
# for each string in the array
# downcase the input string
# convert the string to an array of characters
# create a counter variable initialized to 0
# call the each with index on the array of characters
# check to see if the index of the character in the array matches the index of the character in the alphabet

ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def solve(array)
  arr_cnt = []
  array.each do |string|
    cnt = 0
    string.downcase.chars.each_with_index do |char, idx|
      cnt += 1 if ALPHABET.index(char) == idx
    end
    arr_cnt << cnt
  end
  arr_cnt
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]

# 5 Longest vowel chain
# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

# input: string
# output: integer

# problem: determine the list of substrings from the input string which contain vowels
# include consecutive vowels as one substring
# return the count of the longest substring found

# initialize an empty array, call it substrings
# set a counter to 0
# iterate through the string selecting substrings of vowels and adding them to the substrings array
# select the letter at index of counter
# if not a vowel, increment counter by 1
# if a vowel
  # if prior character (index of counter - 1) was a vowel then append to the current substring
  # else add to the substrings array as a new element
# 

VOWELS = %w(a e i o u)

def solve(string)
  # arr_idx = []
  # string.chars.each_with_index do |char, idx|
  #   arr_idx << idx if VOWELS.include?(char)
  # end
  # arr_idx
  string.split(/[^aeiou]/).map { |substr| substr.length }.max
end

p solve("codewarriors") # == 2
p solve("suoidea") # == 3
# p solve("iuuvgheaae") == 4
# p solve("ultrarevolutionariees") == 3
# p solve("strengthlessnesses") == 1
# p solve("cuboideonavicuare") == 2
# p solve("chrononhotonthuooaos") == 5
# p solve("iiihoovaeaaaoougjyaw") == 8

# 6 non even substrings
# Given a string of integers, return the number of odd-numbered substrings that can be formed.

# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# method that returns all substrings of a given string
# substrings must contain consecutive characters, cannot skip characters
# the substrings list will include the string itself
# 123 example
# 1, 12, 123, 23
# iterate from 0 until length of the string minus 1 (call this counter)
# this will serve as the first argument in our indexed method below
# secondly, iterate between 1 and length of the string minus counter
# string with length of 3 example
# str[0, 1], str[0, 2], str[0, 3]
# str[1, 1], str[1, 2]
# str[2, 1]
def substr(str)
  substr_arr = []
  str_len = str.length
  0.upto(str_len - 1) do |counter|
    1.upto(str_len - counter) do |len|
      substr_arr << str[counter, len]
    end
  end
  substr_arr
end

def odd_substr(str)
  cnt = 0
  substr(str).each { |sub| cnt += 1 if sub.to_i.odd? }
  cnt
end

p odd_substr("1341") == 7

# 7 substring fun
Complete the function that takes an array of words.

# You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

# For example:

# ["yoda", "best", "has"]  -->  "yes"
#   ^        ^        ^
#   n=0     n=1     n=2
# Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

# input: an array of words
# output: string

# problem: create a word by choosing the letters from the input words that are in the indexed position of that word
# For example: word in index 0, we choose the letter in index 0, word in index 1, we choose the letter in index 1, and so forth

# Initialize a variable called string to an empty string
# Iterate from 0 to the length of the array, call this variable idx
# Array index idx of the array (returns the word) index idx (returns the first letter)
# Add this letter to string

def nth_char(array)
  string = ''
  0.upto(array.length - 1) do |idx|
    string<< array[idx][idx]
  end
  string
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'

# 8.Repeated Substring
# For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

# Example #1:

# for string

# s = "ababab"
# the answer is

# ["ab", 3]
# Example #2:

# for string

# s = "abcde"
# the answer is

# because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

# input: string
# output: array with two elements

# problem: given a string of repeated substrings, find the smallest substring such that substring repeated k times is the string itself

# initialize an empty array, substr
# find the substrings of string, add them to substr
# take the unique values of substr (remove dupes) and sort from smallest to largest by length
# iterate over each substring
# if remainder length of the string / length of the substr equal to 0
  # Multiply the substr by the length of the string / length of the substr
  # If the resulting string is equal to the original string then return the count of the substring length

def substr(str)
  substr_arr = []
  str_len = str.length
  0.upto(str_len - 1) do |counter|
    1.upto(str_len - counter) do |len|
      substr_arr << str[counter, len]
    end
  end
  substr_arr
end
  

def f(string)
  substr = substr(string)
  substr_sorted = substr.uniq.sort_by { |str| str.length }
  substr_sorted.each do |substr|
    multiplier = string.length / substr.length
    if string.length % substr.length == 0
      return [substr, multiplier] if substr * multiplier == string
    end
  end
end

p f("aaaaa") #== ["a", 5]
p f("ababab") #== ["ab", 3]
p f("abcde") #== ["abcde", 1]

# 9.Typoglycemia Generator
# (https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
# 5 kyu

# Background
# There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters. 

# Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

# In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

# Requirement
# return a string where:

# 1) the first and last characters remain in original place for each word
# 2) characters between the first and last characters must be sorted alphabetically
# 3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

# Assumptions

# 1) words are separated by single spaces
# 2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# 3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# 4) for this kata punctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
# 5) ignore capitalisation

# for reference: http://en.wikipedia.org/wiki/Typoglycemia

# input: string
# output: string

# requirements: scramble non-outer letters of each word passed in by putting them in alphabetical order
# Leave special characters in their original position

# pseudocode
# if the string length is less than 3 then return the string
# extract the letters only
# Scramble the letters
  # convert string to an array of individual letters
  # sort middle (non-outer letters)
  # leave scrambled letters as an array
# iterate through the string one character at a time
# if the character is a letter:
  # replace with the first letter of the return string
  # remove the first letter of the character array
# if the character is not a letter:
  # move to the next character


def scramble_word(string)
  return string if string.length < 3
  letter_arr = []
  string.each_char { |char| letter_arr << char if char =~ /[a-zA-Z]/ }
  letter_arr_scr = [letter_arr[0]] + letter_arr[1..-2].to_a.sort + [letter_arr[-1]]
  scrambed_arr = []
  string.chars.each_with_index do |char, idx|
    if char =~ /[^a-zA-Z]/ 
      scrambed_arr[idx] = char
    else
      scrambed_arr[idx] = letter_arr_scr.shift
    end
  end
  scrambed_arr.join
end

def scramble_words(phrase)
  scr_word_arr = []
  phrase.split.each { |word| scr_word_arr << scramble_word(word) }
  scr_word_arr.join(' ')
end

# test cases
p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

# 10.Most frequently used words in a text]
# (https://www.codewars.com/kata/51e056fe544cf36c410000fb/train/ruby)
# 4 kyu

# Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

# Assumptions:
# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
# Matches should be case-insensitive, and the words in the result should be lowercased.
# Ties may be broken arbitrarily.

# this still needs work
def top_3_words(phrase)
  new_str = ''
  phrase.downcase.each_char { |char| new_str << char if char =~ /[a-z' ]/ }
  word_hash = {}
  new_str.split.each do |word|
    if word_hash[word]
      word_hash[word] += 1
    else
      word_hash[word] = 1
    end
  end
  sorted_arr = word_hash.sort_by { |_, val1, val2| val2 <=> val1 }
  final_arr = []
  0.upto(2) do |idx|
    final_arr << sorted_arr[idx][0]
  end
  final_arr
end

p top_3_words("How many roads must a man walk down before they call him a man?  Yes and how many seas must a white dove sail before she sleeps in the sand?")
p top_3_words("Test to see test to find out test See test and see") #== ["test", "see", "to"]
p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.") == ["a", "of", "on"]

# 11.Extract the domain name from a URL
# (https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)
# 5 kyu

# Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

# input: string
# output: string

# requirements
# given a url, return the domain name as a string
# rules of a domain name:
  # begins after a colon and two forward slashes ('://') OR after 'www'
  # AND it ends right before a period

# algorithm
# determine the index of the start of the domain name
# if the URL contains '://'
  # return the index of the colon
  # set the start index for the domain name to be index of the colon + 3
# look for 'www'
  # return the index of the first 'w'
  # set the start index for the domain name to be index of the 'w' + 4
# pull in all letters starting at the starting index until there is a period

def domain_name(url)
  url_arr = url.split(/[\/.]/)
  domain_index = if url_arr.index("www")
                   url_arr.index("www") + 1 
                 else
                   url_arr.index("") + 1
                 end
  url_arr[domain_index]
end

# test cases
p domain_name("http://github.com/carbonfive/raygun") == "github" 
p domain_name("http://www.zombie-bites.com") == "zombie-bites"
p domain_name("https://www.cnet.com") == "cnet"

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"

# 12. Detect Pangram
# (https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby)
# 6 kyu

# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

# input: string
# output: boolean

# check to see if each of the characters in the alphabet is utilized in the given string
# if it is then return true
# if it isn't then return false

# iterate over an array of the alphabet
# downcase the string
# check to see if each item is included in the downcased string
# return false as soon as one item is not included in the string
# else return true

def panagram?(string)
  alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  panagram = true
  alphabet.each do |char|
    panagram = false if string.downcase.include?(char) == false
  end
  panagram
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

# 13. Kebabize
# (https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby)
# 6 kyu

# Modify the kebabize function so that it converts a camel case string into a kebab case.

# kebabize('camelsHaveThreeHumps') // camels-have-three-humps
# kebabize('camelsHave3Humps') // camels-have-humps
# Notes:

# the returned string should only contain lowercase letters

# input: string
# output: string

# initialize a new variable str_kebab = ''
# iterate through each character in the original string
# if a lower case letter then add that letter to the new variable
# if an upper case letter then add '-' plus the lowercased letter to the new variable
# if a number then go to the next character

def kebabize(string)
  str_kebab = ''
  string.each_char do |char|
    if char =~ /[a-z]/
      str_kebab << char
    elsif char =~ /[A-Z]/
      str_kebab << '-' + char.downcase
    else
      next
    end
  end
  str_kebab
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# 14. Dubstep
# (https://www.codewars.com/kata/551dc350bf4e526099000ae5/train/ruby)
# 6 kyu

# Polycarpus works as a Dhttps://www.codewars.com/kata/551dc350bf4e526099000ae5/train/rubyJ in the best Berland nightclub, and he often uses dubstep music in his performance. Recently, he has decided to take a couple of old songs and make dubstep remixes from them.

# Let's assume that a song consists of some number of words (that don't contain WUB). To make the dubstep remix of this song, Polycarpus inserts a certain number of words "WUB" before the first word of the song (the number may be zero), after the last word (the number may be zero), and between words (at least one between any pair of neighbouring words), and then the boy glues together all the words, including "WUB", in one string and plays the song at the club.

# For example, a song with words "I AM X" can transform into a dubstep remix as "WUBWUBIWUBAMWUBWUBX" and cannot transform into "WUBWUBIAMWUBX".

# Recently, Jonny has heard Polycarpus's new dubstep track, but since he isn't into modern music, he decided to find out what was the initial song that Polycarpus remixed. Help Jonny restore the original song.

# Input
# The input consists of a single non-empty string, consisting only of uppercase English letters, the string's length doesn't exceed 200 characters

# Output
# Return the words of the initial song that Polycarpus used to make a dubsteb remix. Separate the words with a space.

# split the string with "WUB" so that all the "WUB" words are removed
# remove blank strings from the array
# join the strings together with space

def song_decoder(string)
  song_array = string.split("WUB")
  song_array.select { |word| word.length > 0 }.join(' ')
end

# test cases
p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")  == "WE ARE THE CHAMPIONS MY FRIEND"
p song_decoder("AWUBBWUBC") == "A B C"
p song_decoder("AWUBWUBWUBBWUBWUBWUBC") == "A B C"
p song_decoder("WUBAWUBBWUBCWUB") == "A B C"

# 15. Take a Ten Minute Walk
# (https://www.codewars.com/kata/54da539698b8a2ad76000228/train/ruby)
# 6 kyu
# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

# Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).

# input: array
# output: boolean

# problem: check to see if the directions provided in the array create a 10 minute walk
# where you end up at the same starting point

# in order for this to be a valid walk:
# there must be an equal number of 'n's as 's's
# there must be an equal number of 'e's as 'w's
# the number of elements of the array must be strictly equal to 10
# if any of these are not true then return false

def is_valid_walk(array)
  walk = true
  if array.count('n') != array.count('s') ||
     array.count('e') != array.count('w') ||
     array.length != 10
     walk = false
  end
  walk
end

# test cases
p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

# 16. Stop gninnipS My sdroW!
# (https://www.codewars.com/kata/5264d2b162488dc400000001)
# 6 kyu
# Write a function that takes in a string of one or more words, and returns the same string, but with all words with five or more letters five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

# Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

# what if you couldn't use the reverse method?

# input: string
# output: string

# initialize a new empty array, words_arr
# split the string by spaces (will create an array)
# iterate through the array, word by word
# If the word length is greater than or equal to 5, then reverse the letters
# initialize a new empty string, str_rev
# iterate through the words backwards (-1) up to (-word length)
# add each letter to the str_rev
# return this new string
# Add the word or reversed word to the words_arr
# Join the new words in the words_arr with spaces

def spinWords(string)
  words_arr = []
  string.split.each do |word|
    if word.length >= 5
      str_rev = ''
      1.upto(word.length) do |idx|
        str_rev << word[-idx]
      end
      words_arr << str_rev
    else
      words_arr << word
    end
  end
  words_arr.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords("test") == "test"

# 17. Write Number in Expanded Form
# (https://www.codewars.com/kata/5842df8ccbd22792a4000245)
# 6 kyu
# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

# If you liked this kata, check out part 2!!

# If the number is less than or equal to 10 then return the number
# create a new empty array, num_array
# set multiplier = 10
# Divide the number by 10 to find the result and the remainder (using divmod)
# Add the remainder to the beginning of the num_array (using unshift) if remainder > 0
# If the result is > 9:
  # multiply counter by 10
  # then go to the next loop
# If the result is zero then exit the loop
# If the result is between 1 and 9 (inclusive)
  # multiply the result by the counter  
  # Add the result of the multiplication to the beginning of the num_array (using unshift)
  # exit the loop
# return num_array joined with ' '

def expanded_form(num)
  num_array = []
  multiplier = 10
  loop do
    result, remainder = num.divmod(10)
    num_array.unshift(remainder * multiplier / 10) if remainder > 0
    if (1..9).include?(result)
      num_array.unshift(result * multiplier)
    end
    multiplier *= 10
    num = result
    break if result < 10
  end
  num_array.join(' + ')
end

p expanded_form(12) #== '10 + 2'
p expanded_form(42) #== '40 + 2'
p expanded_form(70304) #== '70000 + 300 + 4'

# 18. Persistent Bugger.
# (https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby)
# 6 kyu
# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

# For example:

#  persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
#                  # and 4 has only one digit

#  persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
#                   # 1*2*6=12, and finally 1*2=2

#  persistence(4) # returns 0, because 4 is already a one-digit number

# input: integer
# output: integer

# given a positive integer, multiply the digits together, take the result 
# of that multiplication and continue to multiply digits together until 
# the result of the final multiplication is one digit long

# set a counter to 1
# initialize a variable result to 0
# start a loop
# change the number to a string
# multiply the characters together after converting them each to an integer
# set num = result
# return counter if result.to_s.length == 1
# increment counter by 1

def persistence(num)
  counter = 0
  return 0 if num < 10
  loop do
    num_array = num.to_s.chars
    result = num_array.inject(1) { |product, n| product * n.to_i }
    num = result
    counter += 1
    break if result.to_s.length == 1
  end
  counter
end

# test cases
p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4

# 19. Title Case
# (https://www.codewars.com/kata/5202ef17a402dd033c000009)
# 6 kyu
# A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

# Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

# input: two strings
# output: string

# downcase and split the 2nd string passed in by spaces, save as an array, call it minor_words
# create a new array title_words
# iterate through each of the words in the 1st string, 0 up to length of string minus 1
# downcase the word
# For first word only:
# Capitalize the first letter of the first word (no matching)
# For all other words:
# check if it is included in the minor_words array
  # If it is not included:
    # capitalize the first letter of the word
# For each word:
# Add the updated first word to the title_words array
# return the joined title_words (on space)

def title_case(title, minor_words = '')
  minor_words = minor_words.downcase.split
  title_words = []
  title.split.each_with_index do |word, idx|
    word = word.downcase
    updated_word = if idx.zero?
                     word.capitalize
                   else
                     minor_words.include?(word) ? word : word.capitalize
                   end
    title_words << updated_word
  end
  title_words.join(' ')
end

# test cases
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('a clash of a KING', 'a an the of') == 'A Clash of a King'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'

# 20. Count and Group Character Occurrences in a String
# (https://www.codewars.com/kata/543e8390386034b63b001f31)
# 6 kyu
# Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.

# The characters should be sorted alphabetically e.g:

# get_char_count("cba") => {1=>["a", "b", "c"]}
# You should ignore spaces, special characters and count uppercase letters as lowercase ones.
# =end

# input: string
# output: hash

# get rid of special characters
# save to a new string
# find all the unique lowercase letters in the new string
# create a new empty hash count_hash
# iterate through the unique letters
# count the number of times that letter appears in the string
# check to see if that number is already a key in the hash
# if it is then add that letter to the value array
# if it is not then add a new key value pair with the count as the key 
# and the value as an array with the letter as the element
# return the hash

def get_char_count(string)
  string_clean = ''
  string.downcase.each_char { |c| string_clean << c if c =~ /[a-z0-9]/ }
  count_hash = {}
  string_clean.chars.uniq.each do |c|
    cnt = string_clean.count(c)
    count_hash[cnt] ? count_hash[cnt] << c : count_hash[cnt] = [c]
  end
  count_hash.map { |key, value| count_hash[key] = value.sort }
  count_hash.sort_by { |key1, key2, _| key2 <=> key1 }.to_h
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

# 21. Find the Mine!
# (https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby)
# 6 kyu
# You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

# Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

# The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

# input: array
# output: array

# given a set of arrays that represent the rows of a minefield 
# with the number 1 marking the mine, return the row and column 
# of the mine location as an array

# count the number of input arrays, n
# iterate through each of the input arrays
  # iterate through each element of each input array until the 1 is found
  # return the index of the subarray within the passed in array (this will become the 1st digit of the return value)
  # return the index of the position where 1 appears (this will become the 2nd digit of the return value)

def mineLocation(array)
  loc_arr = []
  array.each_with_index do |subarr, idx|
    if subarr.include?(1)
      loc_arr[0] = idx
      loc_arr[1] = subarr.index(1)
    end
  end
  loc_arr
end

# test cases
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

# 22. Scramblies
# (https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
# 5 kyu
# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

# Notes:

# Only lower case letters will be used (a-z). No punctuation or digits will be included.
# Performance needs to be considered
# Input strings s1 and s2 are null terminated.

# return false if the length of str2 > length of str1
# iterate through each character of str2
# check to see if the character exists in str1
# if it does exist then remove the first instance of it
# return false if a letter doesn't exist in str1
# return true if all letters were successfully checked

def scramble(str1, str2)
  return false if str2.length > str1.length
  str2.each_char do |char|
    if str1.include?(char)
      str1.sub!(char,'')
    else
      return false
    end
  end
  true
end

# test cases
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('scriptjava','javascript') == true

# 23. Longest alphabetical substring
# (https://www.codewars.com/kata/5a7f58c00025e917f30000f1)
# 6 kyu
# Find the longest substring in alphabetical order.

# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

# There are tests with strings up to 10 000 characters long so your code will need to be efficient.

# The input will only consist of lowercase characters and will be at least one letter long.

# If there are multiple solutions, return the one that appears first.

# create an array of substrings
# create a hash of those substrings with the key as the length of the substring
# and the value as an array containing all the substrings with the first being the substring that appeared first
# sort the hash so that it is in descending order by key
# iterate over the hash, starting with the largest substrings first
# iterate over the value arrays
# check to see if the substring is ordered alphabetically
# check to see if when sorted it matches the string
# if it does then return the string

# returns an array of substrings when a string is passed in
def substring(string)
  substr_arr = []
  0.upto(string.length - 1) do |first_pos|
    first_pos.upto(string.length - 1) do |second_pos|
      substr_arr << string[first_pos..second_pos]
    end
  end
  substr_arr
end

def longest(string)
  substr_hash = {}
  substring(string).each do |substr|
    substr_len = substr.length
    substr_hash[substr_len] ? substr_hash[substr_len] << substr : 
                              substr_hash[substr_len] = [substr]
  end
  substr_hash = substr_hash.sort { |key1, key2, _| key2 <=> key1 }.to_h
  substr_hash.each_value do |arr|
    arr.each do |str|
    return str if str.chars.sort.join == str
    end
  end    
  nil
end

# test cases
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
=end
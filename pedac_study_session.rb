# Study session
# =begin
# There are a bunch of words and we need to check each word to see if it is the result of duplicating a portion of its letters.
# =end

# Pedac Template
# problem:
# restate the problem:

# input: 
# output: 

# clarifying questions:

# rules:

# examples:

# edge cases:

# data structure

# algorithm:
# can I break this down into smaller pieces?
# high level

# low level

# code:


# problem:
# given a string that contains words, check to see if a given word can be 
# formed by duplicating letters from a substring of its letters

# input: string
# output: array of substrings?

# Questions:
# what constitutes a substring?
# What are we returning?

# Assumption:
# assuming substring is more than one character

# high level algorithm
# find the substrings (length > 2) 
# check to see if that substring can be multiplied by length of the word / length of substring which would then result in the word?
  # if so, then return something (TBD)

# low level algorithm
# find the unique substrings of the string (length > 2) 
  # initialize a variable substrings []
  # start_idx: iterate from index 0 through string length - 2
  # end_idx: iterate from start_idx + 1 through string length - 1
  # add substring of string[start_idx..end_idx] to substrings array
  # return unique substrings
# call unique_substrings method with string as the argument
  # iterate through each substring
  # multiplier = length of the word / length of the substring
  # check to see if that substring multiplied by the multiplier == original string
    # if true, then return true
  # if all substrings have been checked and nothing has been returned, then return false.

def substrings(string)
  substrings = []
  (0...string.length - 1).each do |start_idx|
    ((start_idx + 1)...string.length).each do |end_idx|
      substrings << string[start_idx..end_idx]
    end
  end
  substrings
end

def repeated_substring_pattern(string)
  substrings = substrings(string).uniq.select do |sub|
    sub.length <= string.length / 2
  end
  substrings.each do |substr|
    multiplier, remainder = string.length.divmod(substr.length)
    return true if remainder.zero? && substr * multiplier == string
  end
  false
end

# test cases
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true






 
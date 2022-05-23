# RB109
# Variable Scope Examples
# duty-free purchase at Doha Airport
# which currency should I use?
# Assume no foreign transaction or currency conversion fees

=begin
dollars = 20
riyals = 70

def riyals_to_dollars(riyals)
	dollars = riyals / 3.66
end

puts riyals_to_dollars(riyals) # => 19.12568306010929
puts dollars # => 20

# What did we learn?
# 1. Buy using riyals
# 2. Dollars variable defined within the method riyals_to_dollars is locally scoped to the method.

# dollars = 20
# riyals = 70
# RIYALS_PER_DOLLAR = 3.66

# def riyals_to_dollars(riyals)
# 	dollars = riyals / RIYALS_PER_DOLLAR
# end

# puts riyals_to_dollars(riyals) # => 19.12568306010929
# puts dollars # => 20

# Principle 2: Inner scope can access variables initialized in an outer scope, but not vice-versa.
# Add up our purchases in Riyals
purchases = [70, 22, 55]
total = 0
purchases.each { |item| total += item }
puts total # => 147
puts item # => undefined local variable or method `item' for main:Object (NameError)

# The block is { |item| total += item } and this contains its own scope (called the inner scope)
# Variable initialized in the inner scope:
# item
# Variables initialized in the outer Scope:
# purchases
# total

# Notice how the block can access the variable total which is initialized in the outer scope.
# Notice how the variable item cannot be accessed by the outer scope.
=end

# arr = [1, 2, 3]

# for i in arr do
#   a = 5      # a is initialized here
# end

# puts a # => 5 (a is accessible because "for" is part of the Ruby language and is not a method)

# But we get an error (same as above error) if we re-write it this way:
3.times { |n| a = 3 }   # method invocation with a block

puts a # => undefined local variable or method `a' for main:Object (NameError)


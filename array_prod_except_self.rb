=begin
https://leetcode.com/problems/product-of-array-except-self/
https://leetcode.com/submissions/detail/573370392/

Did an O(N) solution fine, and did it in a very Ruby way. 
But didn't quickly connect the dots on the solution with less memory, should
have stuck with trying to figure out the better way of "turning around" and
keeping tally of a running product.
=end

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  out = []
  prefix_prod = Array.new(nums.length, 1)
  suffix_prod = Array.new(nums.length, 1)
  (1...nums.length).each { |i| prefix_prod[i] = nums[i-1] * prefix_prod[i-1] }
  (0...nums.length - 1).reverse_each { |i| suffix_prod[i] = nums[i+1] * suffix_prod[i+1] }
  (0...nums.length).each {|i| out << prefix_prod[i] * suffix_prod[i]}
  out
end

=begin
intuitive: compute product of entire array, then divide product by each element.
  -> NOT ALLOWED

DP: prefix_product and suffix_product arrays.
  prefix_product[i] is the product of all elements index < i
  suffix_product[i] is product of all elements index > i 
  return map of prefix_prod[i] * suffix_prod[i]

With just one array... intuition is to make use of a pass in each direction.
  (implement basic first to  get something working)

=end


=begin
Wups, should have recognized we do NOT need to 
factorize the whole entire thing.

Would have been much better to just iteratively divide the number by
5, 3, and 2 etc. We don't need all those extra primes floating around in 
memory. 


https://leetcode.com/problems/ugly-number
https://leetcode.com/submissions/detail/565788267/
=end

def is_ugly(n)
  return false if n < 1
  uglies = Set.new([2, 3, 5])# Set.new(ugly_factorize(n)) == Set.new([2, 3, 5])
  factors = ugly_factorize(n)
  factors.each { |fact| return false unless uglies.include?(fact) }
  true
end

def ugly_factorize(n)
  uglies = [2, 3, 5]
  uglies.each do |factor|
    return [factor] + ugly_factorize(n/factor) if n % factor == 0
  end
  n == 1 ? [] : [n]
end
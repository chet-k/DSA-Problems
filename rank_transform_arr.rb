=begin
https://leetcode.com/submissions/detail/552740945/
https://leetcode.com/problems/rank-transform-of-an-array/

Completed as part of mock assessment

sort input array: O(logN) time / N space
put rank into hash: O(N) time / N space
put rank into array: O(N) time / N space
=end

# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
  # sort array: N logN
  # create key val pairs in hash starting at 1
  # loop back thru arr replacing each el with rank
  out = arr.sort
  hash = {}
  rank = 1
  hash[out[0]] = 1
  (1...out.length).each do |i|
    rank += 1 unless out[i] == out[i-1]
    hash[out[i]] = rank
  end
  (0...out.length).each{ |i| out[i] = hash[arr[i]] }
  out
end
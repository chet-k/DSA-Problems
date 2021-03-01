# https://leetcode.com/problems/contains-duplicate/

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    counts = Hash.new(0)
    nums.each do |n|
        return true if counts[n] > 0
        counts[n] += 1
    end
    false
end

# discuss:
# naive solution is O(N^2), scanning rest of the array for each element

# 2-pass create counter hash, then look for any > 1  in the hash
# SIMILAR, MISSED: create set, compare nums.length to nums_set.length

# (SUBMITTED) 1-pass add to  hash as you go, and return true if adding results in duplicate

# MISSED: Note that Ruby is not a low-level language, so built-in functions 
# such as nums.uniq are going to be more optimized


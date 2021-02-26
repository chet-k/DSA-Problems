# @param {Integer[]} nums
# @return {Integer[]}

# https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/

# Naive O(N^2) solution
def smaller_numbers_than_current_quadratic(nums)
    out = [0] * nums.length
    nums.each_with_index do |n, i|
        nums.each_with_index do |n_other, i_other|
            out[i] += 1 if n > n_other and i != i_other
        end
    end
    out
end
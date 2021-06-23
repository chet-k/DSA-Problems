"""
Given an array of integers arr of even length, return true if and only if it is 
possible to reorder it such that arr[2 * i + 1] = 2 * arr[2 * i] 
for every 0 <= i < len(arr) / 2.

"""
# @param {Integer[]} arr
# @return {Boolean}
def can_reorder_doubled(arr)
    # make counts hash 
    # sort NlogN
    # loop thru each element, 
    #   if its double exists, subtract the double AND the element itself from the hash.
    # if hash values all 0, return true else false
    counts = Hash.new(0)
    arr.each {|el| counts[el] += 1}

    sorted_arr = arr.sort_by(:&abs)
    sorted_arr.each do |el|
        
        if counts[el] > 0 
            if counts[el*2] > 0
                counts[el] -= 1
                counts[el*2] -= 1
            else
                return false
            end
        end
    end
end


""" 

Example 1:

Input: arr = [3,1,3,6]
Output: false
Example 2:

Input: arr = [2,1,2,6]
Output: false
Example 3:

Input: arr = [4,-2,2,-4]
Output: true
Explanation: We can take two groups, [-2,-4] and [2,4] to form [-2,-4,2,4] or [2,4,-2,-4].
Example 4:

Input: arr = [1,2,4,16,8,4]
Output: false
 

Constraints:

0 <= arr.length <= 3 * 10^4
arr.length is even.
-10^5 <= arr[i] <= 10^5

"""
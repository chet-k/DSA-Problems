# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
    ans = [-1] * nums1.length
    
    # brute force: for each nums1, 
    #   1. scan nums2 to find element
    #   2. continue scanning nums2 until greater element 
    #       found (add to ans), or end of nums2 (add -1 to ans)
    
    # stack:
    #   1. 1 pass thru nums1, make a hash s.t. h[n] = i1 where n is element and i1 is index in nums1. 
    #   2. 1 pass thru nums2, push element to stack if empty. if next element is smaller push to stack. on greater element, pop until empty, putting the found element into ans at indices for each el in the stack.
    
    h = {}
    nums1.each_with_index {|n, i1| h[n] = i1}
    
    stack = []
    nums2.each do |n|
        if !stack.empty? && n > stack[-1]
            until stack.empty? || n < stack[-1]
                ni = stack.pop
                ans[h[ni]] = n
            end
        end
        stack << n if h.keys.include?(n)
    end
    ans
end
'''
The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

 

Example 1:

Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
- 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
- 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
Example 2:

Input: nums1 = [2,4], nums2 = [1,2,3,4]
Output: [3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
- 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
 

Constraints:

1 <= nums1.length <= nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 104
All integers in nums1 and nums2 are unique.
All the integers of nums1 also appear in nums2.
'''
"""
Given two arrays arr1 and arr2, the elements of arr2 are distinct, 
and all elements in arr2 are also in arr1.

Sort the elements of arr1 such that the relative ordering of items in arr1 are 
the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.

 

Example 1:

Input: arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
Output: [2,2,2,1,4,3,3,9,6,7,19]
"""

# LC Easy difficulty.
# Ruby beats 100%. Messy because came up with it in mock OA setting, 15 mins

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
    index_2 = {}
    arr2.each.with_index {|el, i| index_2[el] = i} # faster way to do arr2.index(el)
    
    staging_arr = Array.new(arr2.length + 1){Array.new} # did have to google this line
    
    arr1.each do |el|
        staging_i = index_2[el]
        if staging_i
            staging_arr[staging_i] << el
        else
            staging_arr[-1] << el
        end
    end
    
    staging_arr[-1].sort!
    ans = []
    staging_arr.each {|subarr| ans += subarr}
    ans
end
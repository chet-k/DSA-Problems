'''
https://leetcode.com/problems/shuffle-string/
https://leetcode.com/submissions/detail/533456871/
submitted as part of assessment
'''

# @param {String} s
# @param {Integer[]} indices
# @return {String}
def restore_string(s, indices)
    new_arr = [""] * indices.length
    indices.each_with_index {|el, i| new_arr[el] = s[i]}
    
    
    new_arr.join("")
end
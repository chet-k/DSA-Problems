# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
    return true if nums.length == 1
    
    i_slow = nums.length - 1
    i_fast = i_slow - 1
    
    while i_slow > 0
        if nums[i_fast] >= i_slow - i_fast
            i_slow = i_fast
            i_fast = i_slow - 1
        else
            i_fast -= 1
            return false if i_fast < 0
        end
    end
    true
end
'''
611. Valid Triangle Number
https://leetcode.com/problems/valid-triangle-number/

Given an integer array nums, return the number of triplets chosen from the 
array that can make triangles if we take them as side lengths of a triangle.
'''

# triplet condition: n3 < (n2 + n1) where n1 <= n2 <= n3


# O(N^2)
def triangle_number(nums)
    nums.sort!
    count = 0
    (0..nums.length-3).each do |i1|
        next if nums[i1] == 0
        i3 = i1 + 2
        (i1+1..nums.length-2).each do |i2|
            i3 += 1 until i3 == nums.length || nums[i3] >= nums[i1] + nums[i2]
            
            # THIS IS THE CRUCIAL STEP - WE'RE SKIPPING ALL THE OPERATIONS 
            # BETWEEN i2 AND i3
            count += i3 - i2 - 1 
        end
    end
    count
end
# trick is amortized execution time.
# there is a while loop here, BUT 
# for any i1, i2 and i3 don't backtrack; they each walk at most 
# total n steps. for each i1, i2 goes n (N2), 
# and for each i1, i3 goes n (N2),
# meaning O(N2 + N2) instead of O(N2 * N)
#
# in other words, during the ENTIRE i2 loop, 
#   all runs through the while loop below will together cover 
#   all elements.



# O(N2*LOGN) --Leetcode TLE--
def bs_last_less_or_eq(sorted_nums, target)
    return nil if sorted_nums[0] > target

    i = sorted_nums.length / 2
    if sorted_nums.length == 1
        0
    elsif sorted_nums.length == 2
        n1, n2 = sorted_nums
        n2 <= target ? 1 : 0
    elsif sorted_nums[i] <= target # include and search to right
        i + bs_last_less_or_eq(sorted_nums[i..-1], target)
    else # exclude and search to left    
        bs_last_less_or_eq(sorted_nums[0...i], target)
    end
end
# puts bs_last_less_or_eq([0,1,2,3,4,6,6,7,7,7,10,11,12],6) # => 6
# puts bs_last_less_or_eq([0,1,2,3,4,6,6,7,7,7,10,11,12],13) # => 12
# puts bs_last_less_or_eq([0,1,2,3,4,6,6,7,7,7,10,11,12],-1) # => nil
# puts bs_last_less_or_eq([0,1,2,3,4,6,6,7,7,7,10,11,12],7) # => 9

def triangle_number_n2logn(nums)
    count = 0
    sorted_nums = nums.sort!
    
    (0..sorted_nums.length-3).each do |i1|
        (i1+1..sorted_nums.length-2).each do |i2|
            # for every i1, i2 pair, binary search for the last correct i3 
            target = sorted_nums[i1] + sorted_nums[i2] - 1
            i3_upper_limit = bs_last_less_or_eq(sorted_nums[i2+1..-1], target)
            if i3_upper_limit
                i3_upper_limit += i2 + 1
                count += i3_upper_limit - i2
            end
        end
    end
    count
end
puts triangle_number_n2logn([2,2,3,4]) # => 3
puts triangle_number_n2logn([4,2,3,4]) # => 4
puts triangle_number_n2logn([4,5,6,7,4,3,4,56,78,9,56,34,2,1,26,57,8,3,35,8,59,2,5,35,1,1,1,1,11,22,0,0,33,35,36,0,0,0,0,0,0,0]) # => 855




# O(N3) --Leetcode TLE--
def triangle_number_brute_force(nums)    
    return 0 if nums.length < 3
    count = 0
    nums.sort!
    (0..nums.length-3).each do |i1|
        (i1+1..nums.length-2).each do |i2|
            (i2+1..nums.length-1).each do |i3|
                # sorted nums required, assumes n1 <= n2 <= n3
                count += 1 if nums[i1] + nums[i2] > nums[i3]
            end
        end
    end
    count
end

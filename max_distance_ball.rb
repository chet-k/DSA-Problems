"""
LC 1552 https://leetcode.com/problems/magnetic-force-between-two-balls/
problem description is poorly worded. paraphrase:

Rick has n empty baskets, the ith basket is at position[i]. 
Morty has m balls and needs to distribute the balls into the baskets such that 
we MAXIMIZE the MINIMUM DISTANCE between any two balls.

The distance between two different balls at positions x and y is |x - y|.

Given the integer array position and the integer m, return the optimized distance.

Constraints:

2 <= position.length <= 10^5
1 <= position[i] <= 10^9
All integers in position are distinct.
2 <= m <= position.length
"""

# FAILED TO COME UP WITH SOLUTION WITHIN TIME
# better solution: https://leetcode.com/problems/magnetic-force-between-two-balls/discuss/794066/Simple-Explanation
# I knew I was making this too complicated. Tried to actually place all the 
# balls, when instead needed to search among possible spacings.

"""
# @param {Integer[]} position
# @param {Integer} m
# @return {Integer}

require 'byebug'
def max_distance(position, m)
    # Trivial problem with m = 2. 
    # So break up the problem over and over into the m=2 problem.
    #
    # Sort position. NlogN time.
    # Place ball at left = position.max and right = position.min.
    # The ideal next ball placement is halfway between, so
    #   perform a binary search on position for (left + (left-right)/2)
    #   Now have 3 balls, 1 each at left, mid, right.
    # Keep track of 2 distances, currently (left-mid) and (mid-right)
    #   Binary search for middle of (left-mid) and (mid-right). 
    # 
    # If we still have >= 2 left,
    #   repeat the binary search with subarrays between left-mid and mid-right.
    #   Assuming there exist position[i] in both of those subarrays. 
    # Then, until m < 2, repeat between the minimum 
    #   of left-middle and middle-right, reducing ball count by 2 each iteration
    # When m == 1, repeat one more time on left-middle and right-middle...
    #
    # ... fatal process error: didn't flesh out entire solution before clunking out code!

    
    i_left = 0
    i_right = position.length - 1
    min_dist = position.max - position.min
    balls = m - 2 
    
    position.sort! if balls > 0
    while balls >= 2
        i_mid = bin_search_nearest(arr[i_left..i_right])
        # STOP, OUT OF TIME
    end
    
    min_dist
end
"""

# Even though the overall approach failed, I did come up with this 
# "nearest binary search"
def bin_search_nearest(arr, val)
    # if val is found in arr, return its index. 
    # else, returns the index of the CLOSEST value to val.
    # 
    # this means don't exclude the bounds in recursive calls, they might be the
    # closest value

    if arr.length == 1
        return 0
    elsif arr.length == 2
        return (arr[0] - val).abs <= (arr[1] - val).abs ? 0 : 1
    else
        i_guess = arr.length / 2
        if arr[i_guess] == val
            i_guess
        elsif arr[i_guess] > val
            bin_search_nearest(arr[0..i_guess], val)
        else 
            i_guess + bin_search_nearest(arr[i_guess..-1], val)
        end 
    end
end

# puts bin_search_nearest([1,2,3,5,6,7,8,9,11],10)


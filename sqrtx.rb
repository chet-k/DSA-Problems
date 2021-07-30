'''
Given a non-negative integer x, compute and return the square root of x.

Since the return type is an integer, the decimal digits are truncated, and only 
the integer part of the result is returned.

Note: You are not allowed to use any built-in exponent function or operator, 
such as pow(x, 0.5) or x ** 0.5.
'''


# @param {Integer} x
# @return {Integer}

# binary search would be better, linear search is silly. But it works in O(x) time.
def my_sqrt_brute_force(x)
    # brute force: square every integer until you get x
    #   return if exactly correct
    #   return once sqrtx * sqrtx > x, since we truncate decimals
    sqrtx = 0
    while sqrtx <= x
        if sqrtx * sqrtx == x
            return sqrtx 
        elsif sqrtx * sqrtx > x
            return sqrtx - 1
        end
        sqrtx += 1
    end
    
    sqrtx
end


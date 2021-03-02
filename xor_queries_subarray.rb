# https://leetcode.com/problems/xor-queries-of-a-subarray/

# @param {Integer[]} arr
# @param {Integer[][]} queries
# @return {Integer[]}
def xor_queries(arr, queries)
    xor_LtoR = [0]
    all_xor = arr.inject do |x, n| 
        xor_LtoR << (x ^ n) if x
        x ^ n
    end
    
    xor_RtoL = [0]
    arr.reverse.inject do |x, n| 
        xor_RtoL << (x ^ n) if x
        x ^ n
    end
    xor_RtoL.reverse!
    
    out = []
    queries.each do |q| 
        li, ri = q
        if li == ri
            out << arr[li]
        else
            out << (all_xor ^ xor_RtoL[li] ^ xor_LtoR[ri])
        end
    end
    out
end

# Knew the answer quickly but got stuck overthinking the code.
# Had line 26 written down in about 5 minutes.
#
# This solution from discussion is much better.
# def xor_queries(arr, queries)
#   t = 0
#   arr = arr.map { |x| t ^= x } << 0
#   queries.map { |l, r| arr[r] ^ arr[l - 1] }
# end
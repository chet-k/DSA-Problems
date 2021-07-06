'''
1769. Minimum Number of Operations to Move All Balls to Each Box
https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box/

ou have n boxes. You are given a binary string boxes of length n, where 
boxes[i] is "0" if the ith box is empty, and "1" if it contains one ball.

In one operation, you can move one ball from a box to an adjacent box. 
Box i is adjacent to box j if abs(i - j) == 1. Note that after doing so, there 
may be more than one ball in some boxes.

Return an array answer of size n, where answer[i] is the minimum number of 
operations needed to move all the balls to the ith box.

Each answer[i] is calculated considering the initial state of the boxes.
'''

# @param {String} boxes
# @return {Integer[]}

# @param {String} boxes
# @return {Integer[]}
def min_operations(boxes)
    # calculate answer for each index: O(N^2) worst case for all boxes full.
    # better way: 
    # calculate answer for index zero.
    # All balls are to the right, or in current bin.
    # No balls are to the left.
    # Move one bin to the right:
    #   add 1 to the answer at index 0 if there was a ball at 0.
    #
    # At an arbitrary index, if you move to the right the answer changes by
    # +1 for each ball to the left of new index
    # -1 for each ball to the right of new index
    # and, need to subtract 1 if there is a ball at new index
    
    ans = [0] * boxes.length
    moves, balls_to_left, balls_to_right = 0, 0, 0
    
    # initial calc, N operations for single index of ans
    boxes.each_char.with_index do |ball, i| 
        if ball == "1" && i > 0
            moves += i
            balls_to_right += 1
        end
    end
    ans[0] = moves
    
    # finish the rest of ans in 1 pass
    boxes.each_char.with_index do |ball, i|
        if i > 0
            balls_to_left += boxes[i-1].to_i
            balls_to_right -= ball.to_i
            moves += balls_to_left - balls_to_right - ball.to_i
            ans[i] = moves
        end
    end
    
    ans
end

'''
Example 1:

Input: boxes = "110"
Output: [1,1,3]
Explanation: The answer for each box is as follows:
1) First box: you will have to move one ball from the second box to the first box in one operation.
2) Second box: you will have to move one ball from the first box to the second box in one operation.
3) Third box: you will have to move one ball from the first box to the third box in two operations, and move one ball from the second box to the third box in one operation.
Example 2:

Input: boxes = "001011"
Output: [11,8,5,4,3,4]
 

Constraints:

n == boxes.length
1 <= n <= 2000
boxes[i] is either "0" or "1".
'''
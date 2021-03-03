# https://leetcode.com/problems/number-of-rectangles-that-can-form-the-largest-square/
# LC Easy

# initial solution:
# @param {Integer[][]} rectangles
# @return {Integer}
def count_good_rectangles_2_pass(rectangles)
    squares = rectangles.map {|ri| ri.min}
    big_squares = squares.select {|k| k == squares.max}
    big_squares.size
end

# @param {Integer[][]} rectangles
# @return {Integer}
def count_good_rectangles(rectangles)
    max_k = 0
    count = 0
    rectangles.each do |ri|
        k = ri.min
        if k > max_k #key: reset max square size on finding a larger square
            count = 1
            max_k = k
        elsif k == max_k
            count += 1
        end
    end
    count
end
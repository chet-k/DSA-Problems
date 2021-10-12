=begin
https://leetcode.com/problems/container-with-most-water/
https://leetcode.com/submissions/detail/569682042/

Had to refer to hints, warm up after break. 
=end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  @height = height
  i1, i2 = 0, @height.length - 1
  max_area = area(i1, i2)
  
  while i1 < i2
    if @height[i1] <= @height[i2]
      temp = i1
      until i1 >= i2 || @height[i1] > @height[temp]
        i1 += 1
      end
    else
      temp = i2
      until i2 <= i1 || @height[i2] > @height[temp]
        i2 -= 1
      end
    end
    max_area = [max_area, area(i1, i2)].max
  end
  max_area
end

def area(i1, i2)
  (i2 - i1) * [@height[i1], @height[i2]].min
end

# naive: find every container O(N2) and take max

# better: start w endpoints, and beginning from *shorter* line, scan inward for a longer line.
#   if there is a longer line, update max and restart scan process
#   if there is not, we're done. O(N) time. We do need to look at every 
#   line, so BCR isn't going to be much better.
# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  ans = []
  top, bottom = 0, matrix.length - 1
  left, right = 0, matrix[0].length - 1
  
  i, j = top, left
  
  while top <= bottom && left <= right
    # travel l -> r
    until j == right + 1
      ans << matrix[i][j]
      j += 1
    end
    break if top == bottom
    j -= 1
    i += 1
    top += 1
    # p "top: #{top} bottom: #{bottom} left: #{left} right: #{right}"
    
    # travel down
    until i == bottom + 1
      ans << matrix[i][j]
      i += 1
    end
    break if left == right
    i -= 1
    j -= 1
    right -= 1
    # p "top: #{top} bottom: #{bottom} left: #{left} right: #{right}"
    
    # travel r -> l 
    until j == left - 1
      ans << matrix[i][j]
      j -= 1
    end
    break if top == bottom
    j += 1
    i -= 1
    bottom -= 1
    # p "top: #{top} bottom: #{bottom} left: #{left} right: #{right}"
    
    # travel up
    until i == top - 1
      ans << matrix[i][j]
      i -= 1
    end
    break if left == right
    i += 1
    j += 1
    left += 1
    # p "top: #{top} bottom: #{bottom} left: #{left} right: #{right}"
  end
  ans
end
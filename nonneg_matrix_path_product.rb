=begin
https://leetcode.com/problems/maximum-non-negative-product-in-a-matrix/
https://leetcode.com/submissions/detail/558707373/

Failed this one and ultimately had to go to discussion. 
Came up with almost correct dp approach, but got stuck.
=end

def max_product_path(grid)
  m, n = grid.length, grid[0].length
  max_prod, min_prod = Array.new(m) {Array.new(n)}, Array.new(m) {Array.new(n)}
  max_prod[0][0], min_prod[0][0] = grid[0][0], grid[0][0]
  
  (1...m).each do |i| 
    max_prod[i][0] = grid[i][0] * max_prod[i-1][0]
    min_prod[i][0] = grid[i][0] * min_prod[i-1][0]
  end
  
  (1...n).each do |j|
    max_prod[0][j] = grid[0][j] * max_prod[0][j-1]
    min_prod[0][j] = grid[0][j] * min_prod[0][j-1]
  end
  
  (1...m).each do |i|
    (1...n).each do |j|
      cur = grid[i][j]
      if cur > 0
        maxp1, maxp2 = cur * max_prod[i-1][j], cur * max_prod[i][j-1]
        minp1, minp2 = cur * min_prod[i-1][j], cur * min_prod[i][j-1]
      else
        maxp1, maxp2 = cur * min_prod[i-1][j], cur * min_prod[i][j-1]
        minp1, minp2 = cur * max_prod[i-1][j], cur * max_prod[i][j-1]
      end
          
      max_prod[i][j] = [maxp1, maxp2].max
      min_prod[i][j] = [minp1, minp2].min
    end
  end
  
  max_prod[-1][-1] >= 0 ? max_prod[-1][-1] % (10**9 + 7) : -1
end
=begin
https://leetcode.com/problems/number-of-islands/
https://leetcode.com/submissions/detail/560002126/

Given an m x n 2D binary grid grid which represents a map of '1's (land) and
 '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands 
horizontally or vertically. You may assume all four edges of the grid are all 
surrounded by water.

Example 1:
Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

Example 2:
Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
 

Constraints:
  m == grid.length
  n == grid[i].length
  1 <= m, n <= 300
  grid[i][j] is '0' or '1'.

=end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  @grid = grid
  m, n = grid.length, grid[0].length
  island_count = 0
  
  (0...m).each do |i|
    (0...n).each do |j|
      if @grid[i][j] == "1"
        island_count += 1
        fill_island(i, j)
      end
    end
  end
  
  island_count
end

def fill_island(i, j)
  return if @grid[i][j] == "0"
  @grid[i][j] = "0"
  fill_island(i-1, j) if i > 0
  fill_island(i+1, j) if i < @grid.length - 1
  fill_island(i, j-1) if j > 0
  fill_island(i, j+1) if j < @grid[0].length - 1
end
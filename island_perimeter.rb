=begin
Daily Explore problem, keeping it simple. O(1) memory, O(row x col) time

every water cell: +1 for each adjacent land cell
every land cell: +1 for each adjacent edge

https://leetcode.com/submissions/detail/565795415/
https://leetcode.com/problems/island-perimeter
=end

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  perim = 0
  row, col = grid.length, grid[0].length
  (0...row).each do |r|
    (0...col).each do |c|
      if grid[r][c] == 1
        perim += 1 if r == 0
        perim += 1 if r == row - 1
        perim += 1 if c == 0
        perim += 1 if c == col - 1
      elsif grid[r][c] == 0
        perim += 1 if r < row - 1 && grid[r+1][c] == 1
        perim += 1 if r > 0 && grid[r-1][c] == 1
        perim += 1 if c < col - 1 && grid[r][c+1] == 1
        perim += 1 if c > 0 && grid[r][c-1] == 1
      end
    end
  end
  perim
end
=begin
https://leetcode.com/problems/largest-plus-sign/
https://leetcode.com/submissions/detail/541152208/

You are given an integer n. You have an n x n binary grid grid with all values 
initially 1's except for some indices given in the array mines. 
The ith element of the array mines is defined as mines[i] = [xi, yi] 
where grid[xi][yi] == 0.

Return the order of the largest axis-aligned plus sign of 1's contained in grid. 
If there is none, return 0.

An axis-aligned plus sign of 1's of order k has some center grid[r][c] == 1 
along with four arms of length k - 1 going up, down, left, and right, and 
made of 1's. Note that there could be 0's or 1's beyond the arms of the plus 
sign, only the relevant area of the plus sign is checked for 1's.
=end

# @param {Integer} n
# @param {Integer[][]} mines
# @return {Integer}
def order_of_largest_plus_sign(n, mines)
  grid = Array.new(n) { Array.new(n, 1) }
  mines.each {|coord| grid[coord[0]][coord[1]] = 0}
  next_U, next_D = Array.new(n) { Array.new(n) }, Array.new(n) { Array.new(n) }
  next_L, next_R = Array.new(n) { Array.new(n) }, Array.new(n) { Array.new(n) }
  
  
  (0...n).each do |r|
    (0...n).each do |c|
      if grid[r][c] == 0
        next_U[r][c], next_L[r][c] = 0, 0
      else
        next_U[r][c] = r > 0 ? next_U[r-1][c] + 1 : 1
        next_L[r][c] = c > 0 ? next_L[r][c-1] + 1 : 1
      end
    end
  end

  (0...n).reverse_each do |r|
    (0...n).reverse_each do |c|
      if grid[r][c] == 0
        next_D[r][c], next_R[r][c] = 0, 0
      else
        next_D[r][c] = r < n-1 ? next_D[r+1][c] + 1 : 1
        next_R[r][c] = c < n-1 ? next_R[r][c+1] + 1 : 1
      end
    end
  end

  highest_order = 0
  (0...n).each do |r|
    (0...n).each do |c|
      coord_order = [next_U[r][c], next_D[r][c], next_L[r][c], next_R[r][c]].min
      highest_order = [highest_order, coord_order].max
    end
  end

  highest_order
end



# tried way too long at this failing tactic. 
# TOO COMPLICATED TO IMPLEMENT QUICKLY
# THERE WERE OBVIOUS SIGNS THIS SHOULD HAVE BEEN DP
=begin
class Solution
  def order_of_largest_plus_sign(n, mines)
    @n = n
    
    @mines = mines
    @render = Array.new(@n) { Array.new(@n, 1) }
    @mines.each { |coord| @render[coord[0]][coord[1]] = 0 }

    @mines_set =  Set.new(mines)
    @mines_in_row = Array.new(@n) { Array.new }
    @mines_in_col = Array.new(@n) { Array.new }
    
    mines.each  do |mine|
      @mines_in_row[mine[0]] << mine[1]
      @mines_in_col[mine[1]] << mine[0]
    end
    
    # So, this is O( n * (n * LOG(n)) ), which isn't great 
    # BUT worst case it's still less than brute force n^3
    # AND best case for very sparse mines where 
    # n >> mines.length, it's actually closer to O(n)
    (0...n).each do |i| 
      @mines_in_row[i].sort!
      @mines_in_col[i].sort!
    end

    # TODO optimize by searching in rings out from center
    highest_order = 0
    (0...n).each do |m|
      (0...n).each do |n|
        highest_order = [highest_order, order_of_coord([m, n])].max
      end
    end
    
    highest_order
  end

  def order_of_coord(coord)
    return  0  if @mines_set.include?(coord)
    # debugger
    r, c = coord
    
    # default no mines in cur row or col
    row_order = [@n - r,  r + 1].min
    col_order = [@n - c,  c + 1].min
    
    # find closest mine in row, adjust order
    if @mines_in_row[r].length > 0
      i_right = @mines_in_row[r].bsearch_index {|x| x > c}
      if i_right
        closest_to_right = @mines_in_row[r][i_right]
        closest_to_left = i_right > 0 ? @mines_in_row[r][i_right - 1] : -1
      else
        closest_to_right = @n
        closest_to_left = @mines_in_row[r][-1]
      end
      row_order = [c - closest_to_left, closest_to_right - c].min
    end
    
    # find closest mine in col, adjust order
    if @mines_in_col[c].length > 0
      i_down = @mines_in_col[c].bsearch_index {|x| x > r}
      if i_down
        closest_below = @mines_in_col[c][i_down]
        closest_above = i_down > 0 ? @mines_in_col[c][i_down - 1] : -1
      else
        closest_below = @n
        closest_above = @mines_in_col[c][-1]
      end
      col_order = [r - closest_above, closest_below - r].min
    end
    [row_order, col_order].min
  end

  def render_mines
    @render.each {|row| p row}
    nil
  end
end
=end

test_cases = [
  [5, [[0,0],[0,1],[0,4],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2],[2,3],[2,4],[3,0],[4,0],[4,1],[4,3],[4,4]]],
  [2, [[0,0],[0,1],[1,0]]],
  [5, [[4,2]]],
  [1, [[0,0]]]
]

s = Solution.new

s.order_of_largest_plus_sign(5, [[0,0],[0,1],[0,4],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2],[2,3],[2,4],[3,0],[4,0],[4,1],[4,3],[4,4]])

# 55
# [[6, 9], [33, 34], [27, 0], [0, 27], [28, 0], [0, 28], [27, 1], [1, 27], [1, 28], [28, 1]]
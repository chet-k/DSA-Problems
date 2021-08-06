'''
https://leetcode.com/problems/max-area-of-island/
https://leetcode.com/submissions/detail/533466970/

Not a very good solution. Far right tail of submission time. 
Submitted as part of assessment.
'''

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
    @mapped_islands = Set.new()
    @grid = grid
    max_size = 0
    (0...grid.length).each do |m|
        (0...grid[0].length).each do |n|
            point = grid[m][n] 
            coord = [m, n]
            unless point == 0 || @mapped_islands.include?(coord)
                island_size = explore_island(coord)
                max_size = [island_size, max_size].max
            end
        end
    end
    
    max_size
end

def explore_island(coord)
    return 0 if @mapped_islands.include?(coord)
    cur_size = 1
    @mapped_islands.add(coord)
    
    neighbors(coord).each do |adj_coord|
        m, n = adj_coord
        unless @mapped_islands.include?(adj_coord) || @grid[m][n] == 0
            cur_size += explore_island(adj_coord)
        end                    
    end
    
    cur_size
end

def neighbors(coord)
    out = []
    m, n = coord
    
    out.push([m-1, n]) if m > 0
    out.push([m+1, n]) if m < @grid.length - 1
    out.push([m, n-1]) if n > 0
    out.push([m, n+1]) if n < @grid[0].length - 1
    
    out
end
"""
You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.

Return the size of the largest island in grid after applying this operation.

An island is a connected group of 1s (4 directions, not 8).
"""

require 'set'
require 'byebug'
# @param {Integer[][]} grid
# @return {Integer}

# [[1,1,0,0],[0,0,1,1],[0,0,1,0],[1,0,0,0]]
# [[1,1],[1,1]]
class Solution
    def initialize(grid)
        @grid = grid
    end

    def largest_island #(grid)
        return 1 if @grid.length == 1
        
        # @grid = grid
        @island_size = []
        @map = Array.new(@grid.length) {Array.new(@grid[0].length)}

        map_islands
        max_adj_areas = check_zeros
        
        debug_vars

        if max_adj_areas == 0
            @island_size.length > 0 ? @island_size.max : 1
        else
            max_adj_areas + 1
        end
    end

    def map_islands
        (0...@grid.length).each do |m|
            (0...@grid[0].length).each do |n|
                # if [m, n] == [3, 0]
                #     debugger
                # end
                unless @grid[m][n] == 0 || @map[m][n]
                    @island_size.push(0)
                    add_to_island([m,n], @island_size.length-1)
                end
            end
        end
        
    end

    def check_zeros
        max_adj_areas = 0
        (0...@grid.length).each do |m|
            (0...@grid[0].length).each do |n|
                next if @map[m][n]
                adj_areas = 0
                adj_islands = Set.new()

                neighbors(m,n).each do |adj_coord|    
                    mi, ni = adj_coord
                    adj_islands.add(@map[mi][ni]) if @grid[mi][ni] == 1
                end

                puts "coords: #{[m,n]}"
                puts "neighboring islands: #{adj_islands}"
                if adj_islands.length > 0
                    adj_islands.each {|id| adj_areas += @island_size[id]}
                    max_adj_areas = [max_adj_areas, adj_areas].max
                end
            end
        end
        max_adj_areas
    end

    def add_to_island(coord, island_id)
        m, n = coord
        return if @map[m][n]

        @island_size[island_id] += 1
        @map[m][n] = island_id

        neighbors(m, n).each do |adj_coord|
            mi, ni = adj_coord
            add_to_island(adj_coord, island_id) if @grid[mi][ni] == 1
        end
    end


    def neighbors(m, n)
        out = []
        out.push([m-1, n]) if m > 0
        out.push([m+1, n]) if m < @grid.length - 1 
        out.push([m, n-1]) if n > 0
        out.push([m, n+1]) if n < @grid[0].length - 1 
        out
    end

    def debug_vars
        puts "grid"
        @grid.each {|row| p row}

        puts "island map"
        @map.each {|row| p row}

        puts "island sizes"
        p @island_size
        puts "\n\n"
    end
end
    
    
# s = Solution.new([[1,0],[0,1]])
# p s.largest_island
# s = Solution.new([[1,1,0,0],[0,0,1,1],[0,0,1,0],[1,0,0,0]])
# p s.largest_island
s = Solution.new([[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,0],[1,1,0,0,0],[1,1,1,0,1]])
p s.largest_island
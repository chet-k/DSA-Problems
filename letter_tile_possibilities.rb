'''
https://leetcode.com/problems/letter-tile-possibilities
https://leetcode.com/submissions/detail/535831203/

You have n  tiles, where each tile has one letter tiles[i] printed on it.

Return the number of possible non-empty sequences of letters you can make using the letters printed on those tiles.

 

Example 1:

Input: tiles = "AAB"
Output: 8
Explanation: The possible sequences are "A", "B", "AA", "AB", "BA", "AAB", "ABA", "BAA".
Example 2:

Input: tiles = "AAABBC"
Output: 188
Example 3:

Input: tiles = "V"
Output: 1
 

Constraints:

1 <= tiles.length <= 7
tiles consists of uppercase English letters.
'''


# @param {String} tiles
# @return {Integer}
def num_tile_possibilities(tiles)
    @all_seq = Set.new
    
    dfs("", tiles)
    
    @all_seq.length
end

def dfs(subseq, tiles)
    return if @all_seq.include?(subseq)
    
    @all_seq.add(subseq) if subseq.length > 0 
    
    (0...tiles.length).each do |i|
        dfs(subseq + tiles[i], tiles[0...i] + tiles[i+1..-1])
    end
end
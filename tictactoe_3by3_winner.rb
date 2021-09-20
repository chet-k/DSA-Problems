'''
https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/
https://leetcode.com/submissions/detail/558190523/


'''

# @param {Integer[][]} moves
# @return {String}
def tictactoe(moves)
    return "Pending" if moves.length < 5
    
    diag0 = Set.new([[0,0],[1,1],[2,2]])
    diag1 = Set.new([[0,2],[1,1],[2,0]])

    x_counts = [[0,0,0], [0,0,0], [0,0]] #row, col, diag
    o_counts = [[0,0,0], [0,0,0], [0,0]] #row, col, diag
    
    moves.each_with_index do |move, i|
        row, col = move
        if i.even?
            x_counts[0][row] += 1
            x_counts[1][col] += 1
            x_counts[2][0] += 1 if diag0.include?(move)
            x_counts[2][1] += 1 if diag1.include?(move)
            if x_counts[0][row] == 3 || 
                x_counts[1][col] == 3 || 
                x_counts[2].include?(3)
                return "A"
            end
        else
            o_counts[0][row] += 1
            o_counts[1][col] += 1
            o_counts[2][0] += 1 if diag0.include?(move)
            o_counts[2][1] += 1 if diag1.include?(move)
            if o_counts[0][row] == 3 || 
                o_counts[1][col] == 3 || 
                o_counts[2].include?(3)
                return "B"
            end
        end
        return "Draw" if i == 8
    end
    "Pending"
end
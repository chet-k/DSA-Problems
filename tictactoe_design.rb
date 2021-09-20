'''
https://leetcode.com/problems/design-tic-tac-toe/

'''

class TicTacToe

=begin
    Initialize your data structure here.
    :type n: Integer
=end
    def initialize(n)
        @n = n
        @board = Array.new(n) {Array.new(n)}
        @p1_rows, @p2_rows= Hash.new(0), Hash.new(0)
        @p1_cols, @p2_cols = Hash.new(0), Hash.new(0)
        @p1_diag, @p2_diag = 0, 0
        @p1_antidiag, @p2_antidiag = 0, 0
    end

=begin
    Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins.
    :type row: Integer
    :type col: Integer
    :type player: Integer
    :rtype: Integer
=end
    def move(row, col, player)
        if player == 1
            @p1_rows[row] += 1
            @p1_cols[col] += 1
            @p1_diag += 1 if row == col
            @p1_antidiag += 1 if row == @n - 1 - col
            
            return 1 if @p1_rows[row] == @n ||
                @p1_cols[col] == @n ||
                @p1_diag == @n || @p1_antidiag == @n
        else
            @p2_rows[row] += 1
            @p2_cols[col] += 1
            @p2_diag += 1 if row == col
            @p2_antidiag += 1 if row == @n - 1 - col
            
            return 2 if @p2_rows[row] == @n ||
                @p2_cols[col] == @n ||
                @p2_diag == @n || @p2_antidiag == @n
        end
        0
    end
end

# Your TicTacToe object will be instantiated and called as such:
# obj = TicTacToe.new(n)
# param_1 = obj.move(row, col, player)
# https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position/

# @param {Integer[]} position
# @return {Integer}
def min_cost_to_move_chips(position)
    #count all evens and odds: equivalent to moving all chips to 2 stacks: 0 and 1
    even_count = 0
    odd_count = 0
    position.each do |chips|
        if chips.even?
            even_count += 1
        else
            odd_count += 1
        end
    end
    even_count > odd_count ? odd_count : even_count
end
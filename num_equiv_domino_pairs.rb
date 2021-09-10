=begin
https://leetcode.com/problems/number-of-equivalent-domino-pairs/submissions/

original submitted during assessment:
https://leetcode.com/submissions/detail/552670442/

re-submitted after looking up gauss formula:
https://leetcode.com/submissions/detail/552675884/
=end

# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
    counts = Hash.new(0)
    dominoes.each do |tile| 
        flipped = tile[0] <= tile[1] ? tile : [tile[1], tile[0]]
        counts[flipped] += 1
    end
    pairs = 0
    counts.values.each {|n| pairs += count_pairs(n)}
    pairs
end


def count_pairs(n)
    # there is a O(1) math formula for this...
    n * (n - 1) / 2
    
    # return 0 if n == 1
    # n - 1 + count_pairs(n-1)
end

# brute force is N^2: trivial, compare each domino to every other domino
=begin
def num_equiv_domino_pairs_brute_force(dominoes)
    eq_ct = 0
    (0...dominoes.length-1).each do |i|
        (i+1...dominoes.length).each do |j|
            eq_ct += 1 if dominoes_eq(dominoes[i], dominoes[j])
        end
    end
    eq_ct
end

def dominoes_eq(domino_i, domino_j)
    a, b = domino_i
    c, d = domino_j
    (a == c && b ==  d) || (a == d && b == c)
end
=end
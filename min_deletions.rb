# https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/submissions/
# 1647. Minimum Deletions to Make Character Frequencies Unique

# @param {String} s
# @return {Integer}
def min_deletions(s)
    deletions = 0
    char_counts = Hash.new(0)
    s.each_char {|char| char_counts[char] += 1}
    
    sorted_counts =  char_counts.sort_by {|k, v| v}.reverse

    sorted_counts.each.with_index do |pair, i|
        char, freq = pair
        while char_counts[char] > 0 && is_duplicate_val?(char, char_counts)
            char_counts[char] -= 1
            deletions += 1
        end
    end

    deletions
end

def is_duplicate_val?(char, h)
    freq = h[char]
    h.each {|k, v| return true if v > 0 && v == freq && k != char }
    false
end

puts min_deletions("aaaaaaabbbbbbcccccddddeeeffg")
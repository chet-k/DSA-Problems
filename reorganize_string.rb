def reorganize_string(s)
    out = ""
    counts = Hash.new(0)
    s.each_char {|char| counts[char] += 1}    
    
    # check whether reorg. is impossible
    n = counts.values.max
    return out unless (s.length + 1) / 2 >= n
    
    # Generate string sorted by char count 
    sorted_s = ""
    sorted_counts = counts.sort_by {|k, v| -v}
    sorted_counts.each {|k, v| sorted_s += k * v}
    
    # Generate reorganized string, alternating picks from first and second half of s
    p1 = 0
    p2 = s.length / 2
    p2 += 1 unless s.length.even?
    sorted_s.each_char.with_index do |c, i|
        if i.even?
            out << sorted_s[p1]
            p1 += 1
        else
            out << sorted_s[p2]
            p2 += 1
        end
    end
    out
end
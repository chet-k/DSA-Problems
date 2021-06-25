def all_cells_dist_order(rows, cols, r_center, c_center)
    ans = []
    
    (0...rows).each do |r|
        (0...cols).each do |c|
            ans << [((r-r_center).abs + (c-c_center).abs), [r, c]]
        end
    end
    
    ans.sort_by(&:last).map(&:first)
end
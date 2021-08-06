'''
https://leetcode.com/problems/minimum-time-visiting-all-points/
https://leetcode.com/submissions/detail/533461608/
'''

# @param {Integer[][]} points
# @return {Integer}
def min_time_to_visit_all_points(points)
    t = 0
    (1...points.length).each do |i|
        t += min_time_between_two_points(points[i-1], points[i])
    end
    t
end

def min_time_between_two_points(p1, p2)
    moves = 0
    x1, y1 = p1
    x2, y2 = p2
    
    dx = (x2 - x1).abs
    dy = (y2 - y1).abs
    
    # begin with diagonals.
    # diags are the cheapest movement. 1 second to move sqrt(2) dist
    # whereas vert or horz movement takes 1 sec to move 1 dist.
    
    if dx < dy
        moves += dx
        dy -= dx
        moves += dy
    elsif dy < dx
        moves += dy
        dx -= dy
        moves += dx
    else
        moves += dy
    end
    
    moves
end
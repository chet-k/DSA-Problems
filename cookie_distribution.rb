def find_content_children(g, s)
    cookies_handed_out = 0
    g.sort!
    s.sort!
    
    gi = g.length - 1
    
    s.reverse.each do |cookie|
        gi -= 1 until gi < 0 || g[gi] <= cookie
        break if gi < 0
        cookies_handed_out += 1
        gi -= 1
    end
    cookies_handed_out
end
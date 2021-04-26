# @param {String} input
# @return {Integer}
def length_longest_path(input)
    max_len = 0
    depth_prev = 0
    depth_cur = 0
    file_path = []
    
    dirs = input.split("\n")
    # puts dirs
    
    dirs.each do |element|
        depth_cur = count_depth(element)
        dir_cur = element[depth_cur..-1]
        # puts '...'
        # puts file_path.join("/")
        # puts "current depth: #{depth_cur}, prev depth: #{depth_prev}"
        
        
        if depth_cur == 0
            file_path = [dir_cur]
        
        elsif depth_cur == depth_prev
            file_path.pop
            file_path << dir_cur
            
        elsif depth_cur > depth_prev
            file_path << dir_cur        
            
        elsif depth_cur < depth_prev
            file_path.pop until file_path.length == depth_cur
            file_path << dir_cur
        end
        
        max_len = compare_length(file_path, max_len)
        depth_prev = depth_cur
    end
    
    max_len
end

    
def count_depth(txt)
    depth = 0
    txt.each_char do |char|
        break unless char == "\t"
        depth += 1
    end
    depth
end 

def compare_length(file_path, max_len)
    file_path_str = file_path.join("/")
    if is_file?(file_path[-1]) && file_path_str.length > max_len
        file_path_str.length
    else
        max_len
    end
end

def is_file?(txt)
    txt.include?(".")
end
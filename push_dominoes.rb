=begin
https://leetcode.com/problems/push-dominoes/

Can't win them all. LC solution is much better.
brute force TLE: https://leetcode.com/submissions/detail/552290554/
better frame-by-frame: https://leetcode.com/submissions/detail/552347224/
=end

# @param {String} dominoes
# @return {String}

# improving on brute force, we need to address
# 1. duplicate entire frame every iter -> keep list of moves instead
# 2. look at every domino every frame -> keep queue of dominoes to look at instead
#
# ok, I looked at the solution and this was still bad. 

def push_dominoes(dominoes)
  @dominoes = dominoes
  move_queue = []
  
  (0...@dominoes.length).each do |i|
    if @dominoes[i] == 'L' && i > 0 && @dominoes[i-1] == '.'
      move_queue << i - 1 
    elsif @dominoes[i] == 'R' && i < (@dominoes.length - 1) && @dominoes[i+1] == '.'
      move_queue << i + 1 
    end
  end
    
  until move_queue.empty?
    next_queue, render_list  = [], []
    move_queue.each do |i|
      if @dominoes[i + 1] != 'L' || i == @dominoes.length - 1
        render_list << [i, 'R']
        next_queue << i + 1 if @dominoes[i + 1] == '.' && i < (@dominoes.length) - 1
      elsif @dominoes[i - 1] != 'R' || i == 0
        render_list << [i, 'L']
        next_queue << i - 1 if @dominoes[i - 1] == '.' && i > 0
      end
    end
    render_changes(render_list)
    move_queue = next_queue
  end
  @dominoes
end

def render_changes(render_list)
  # render_list[i]: [domino_index, change]
  render_list.each do |move|
    i, status = move
    @dominoes[i] = status
  end
end




# brute force (TLE)
  #   look at every domino every frame:
  #       dominoes on both sides falling inward? -> do nothing
  #       is domino to L falling R? -> set to R
  #       is domino to R falling L? -> set to L
  #   repeat until no changes
  # -> go ahead and implement, idea for improvement builds on this (creating queue rather than scanning all dominoes)
def push_dominoes_brute_force(dominoes)
  moving = true
  cur_frame = dominoes.dup
  next_frame = dominoes.dup
  while moving
    moving = false
    (0...cur_frame.length).each do |i|
      left_neighbor = i > 0 ? cur_frame[i-1] : '.'
      right_neighbor = i < dominoes.length - 1 ? cur_frame[i+1] : '.'
      
      if cur_frame[i] == '.' && (left_neighbor == 'R' || right_neighbor == 'L')
        if right_neighbor != 'L'
          moving = true
          next_frame[i] = 'R'
        elsif left_neighbor != 'R'
          moving = true
          next_frame[i] = 'L'
        end
      end
    end
    cur_frame = next_frame
    next_frame = cur_frame.dup
  end
  next_frame
end

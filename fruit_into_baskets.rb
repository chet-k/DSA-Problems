# @param {Integer[]} fruits
# @return {Integer}
# require 'set'

# seems like a good sliding window problem. from the repeated work in brute
# force, there must be a way to do a 2 pointer linear scan. 

#start with first 2 elements.
# put 2 elements into counter hash.
# if hash.length <= 2, increase j until hash.length == 3
#   on each increase, update max_count => [j-i, max-count].max
# if hash.length == 3, increase i until hash.length == 2 again.
# stop loop when j gets to end of fruits.

def total_fruit(fruits)
    i, j = 0, 0
    max_trees = 1

    cur_trees = Hash.new(0)
    cur_trees[fruits[i]] += 1

    while j < fruits.length
        if i == j
            j += 1 
            cur_trees[fruits[j]] += 1
        end

        # push j outward until the (i..j) span becomes invalid
        until j == fruits.length || cur_trees.length > 2
            max_trees = [j-i+1, max_trees].max 
            j += 1
            cur_trees[fruits[j]] += 1 if j < fruits.length
        end
        
        # pull i inward until the (i..j) span is valid again
        while j < fruits.length && i < j && cur_trees.length > 2
            cur_trees[fruits[i]] -= 1
            cur_trees.delete(fruits[i]) if cur_trees[fruits[i]] == 0
            i += 1
        end
    end
    max_trees
end


def total_fruit_brute_force(fruits)
    # brute force: 2 pointer O(N^2)
    max_trees = 1 #given fruits min length is 1
    (0..fruits.length-2).each do |i|
        fruit1 = fruits[i]
        
        # scan for fruit 2
        j = i + 1
        while j < fruits.length && fruits[j] == fruits[i]
            i += 1
        end
        
        # not optimal: there is repeated work in this loop, executed for every n
        unless j == fruits.length
            fruit2 = fruits[j]
            while j < fruits.length && (fruits[j] == fruit1 || fruits[j] == fruit2)
                j += 1
            end
        end
        max_trees = [j - i, max_trees].max
    end
    
    max_trees
end

test_cases = [
    [1,2,1],
    [0,1,2,2],
    [1,2,3,2,2],
    [3,3,3,1,2,1,1,2,3,3,4],
    [0],
    [1,1]
]

test_answers = [
    3,
    3,
    4,
    5,
    1,
    2
]

(test_cases.length).times do |i|
    puts "ans: #{total_fruit(test_cases[i])}, expected: #{test_answers[i]}"
end

"""
LC 881 

You are given an array people where people[i] is the weight of the ith 
person, and an infinite number of boats where each boat can carry a maximum 
weight of limit. Each boat carries at most two people at the same time, 
provided the sum of the weight of those people is at most limit.

Return the minimum number of boats to carry every given person.
"""

def num_rescue_boats(people, limit)
    
    people.sort! #straightforward if people are sorted by weight
    boats = 0
    
    lo, hi = 0, people.length - 1
    
    while lo <= hi
        lo += 1 if people[lo] + people[hi] <= limit
        hi -= 1
        boats += 1
    end
    
    boats
end

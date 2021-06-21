# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
require 'byebug'


def can_complete_circuit(gas, cost)
    # small inductive step: 
    # impossible if total gas available is less than total gas required
    return -1 if gas.sum < cost.sum
    
    # big inductive step: 
    # if you start at A and run out at B, 
    # then you can't get past B starting anywhere between A and B either.
    # (not sure, does this depend on the problem constraint that any solution 
    # will be unique?)
    
    start = 0
    i = start
    tank = 0
    counter = 0

    while counter < gas.length
        tank += gas[i]
        tank -= cost[i]
        i += 1
        i = 0 if i >= gas.length
        counter += 1

        if tank < 0
            tank = 0
            start = i
            counter = 0
        end
    end
    start
end

def can_complete_circuit_brute_force(gas, cost)
    #brute force attempting circuit from every point is O(N^2) worst case. 
    # Try it and see if any insights come up
     (0...gas.length).each do |start|
        i = start
        tank = 0
        while tank >= 0
            tank += gas[i]
            tank -= cost[i]
            i += 1
            i = 0 if i >= gas.length
            return start if i == start && tank >= 0
        end
    end
    
    -1
end

# puts can_complete_circuit([1,2,3,4,5], [3,4,5,1,2])
puts can_complete_circuit([2,3,4], [3,4,3])
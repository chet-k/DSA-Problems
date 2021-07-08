# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
    # all possible permutaions means some brute force
    # how to ensure unique? Hashed set seems simplest, then return set.to_a
    
    perms = Set.new
    perms.add [nums[0]]
    
    nums[1..-1].each do |n|
        new_perms = []
        perms.each do |arr|
            (0..arr.length).each do |i|
                new_perms << arr[0...i] + [n] + arr[i..-1]
            end
        end
        perms = Set.new new_perms
    end
    
    perms.to_a
end
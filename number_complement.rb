'''
LC 476
Given a positive integer num, output its complement number. 
The complement strategy is to flip the bits of its binary representation.
'''

# @param {Integer} num
# @return {Integer}
def find_complement(num)
    bin = num.to_s(2).split('')
    bin.map {|b| b == '0' ? '1' : '0'}.join('').to_i(2)
end
# @param {String[]} words
# @return {Integer}

'''
LC 318 https://leetcode.com/problems/maximum-product-of-word-lengths/
Given a string array words, return the maximum value of 
    length(word[i]) * length(word[j]) 
where the two words do not share common letters. 
If no such two words exist, return 0.

TAKEN FROM https://leetcode.com/problems/maximum-product-of-word-lengths/discuss/76998/Ruby-Solution-Bit-Operation


'''
 def max_product(words)
    words = words.sort_by(&:length).reverse

    # 1. Pre-process each word into binary forms
    bins = words.map do |word|
      word.chars.reduce(0){|val, ch| val |= 1 << (ch.ord - 'a'.ord) }
    end

    max = 0
    words.each_with_index do |a, i|
      # 2. It'll be TLE without this pruning
      next if a.length * a.length <= max

      words[i+1..-1].each_with_index do |b, j|
        debugger
        next if (bins[i] & bins[i+1+j]).nonzero?

        max = [ max, a.length * b.length ].max
      end
    end

    max
  end

  max_product_LC(["abcw","baz","foo","bar","xtfn","abcdef"])
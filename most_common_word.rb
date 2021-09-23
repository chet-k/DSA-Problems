'''
https://leetcode.com/problems/most-common-word/
https://leetcode.com/submissions/detail/559968182/
'''

# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
  symbols = Set.new(("!?',;.").split(''))
  word_counts = Hash.new(0)
  banned_set = Set.new(banned)
  
  clean_par = sanitize_str(paragraph, symbols)
  words = clean_par.split(' ')
  
  most_com_word, max_ct = '', 0
  words.each do |word| 
    word_counts[word] += 1 unless banned_set.include?(word) || word == ''
    if word_counts[word] > max_ct
      most_com_word, max_ct = word, word_counts[word]
    end
  end
  
  most_com_word
end

def sanitize_str(word, filter_set)
  # return string DOWNCASED and REPLACE SYMBOLS with " "
  new_str = ''
  word.each_char do |char|
    clean_char = filter_set.include?(char) ? " " : char.downcase
    new_str += clean_char
  end
  new_str
end

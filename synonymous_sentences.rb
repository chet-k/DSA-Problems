=begin
LC 1258  https://leetcode.com/problems/synonymous-sentences/

Assessment timed submission:
https://leetcode.com/submissions/detail/553872891/

Fixed submission:
https://leetcode.com/submissions/detail/553902117/
=end
require 'set'

# @param {String[][]} synonyms
# @param {String} text
# @return {String[]}
def generate_sentences(synonyms, text)
  @synonyms_for = Hash.new {|h, k| h[k] = Array.new}
  synonyms.each do |pair|
    wd1, wd2 = pair
    @synonyms_for[wd1] << wd2
    @synonyms_for[wd2] << wd1
  end
  
  perms_list = []
  text.split(' ').each {|word| perms_list << all_synonyms(word) }
  
  @sentences = []
  word_permutations('',perms_list)
  @sentences.sort
end

def all_synonyms(word, syn_list = Set.new)
  return [word] unless @synonyms_for[word].length > 0
  syn_list.add(word)
  @synonyms_for[word].each do |s|
    unless syn_list.include?(s)
      all_synonyms(s, syn_list).each {|w| syn_list.add(w)}
    end
  end
  syn_list.to_a
end

def word_permutations(path, list)
  if list.length == 0
    @sentences << path.chop
  else
    cur_word = list[0]
    cur_word.each do |synonym|
      word_permutations(path + synonym + ' ', list[1..-1])
    end
  end
end

synonyms_test = [
  [["happy","joy"],["sad","sorrow"],["joy","cheerful"]],
  [["happy","joy"],["cheerful","glad"]],
  [["a","b"],["c","d"],["e","f"]],
  [["a","QrbCl"]]
]
text_test = [
  "I am happy today but was sad yesterday",
  "I am happy today but was sad yesterday",
  "a c e",
  "d QrbCl ya ya NjZQ"
]

(0...synonyms_test.length).each do |i|
  sentences = generate_sentences(synonyms_test[i], text_test[i])
  sentences.each {|s| p s}
  puts '------------------------'
end
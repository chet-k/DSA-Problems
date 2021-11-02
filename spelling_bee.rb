# gem install fast_trie
require 'trie'

=begin
  Solutions for NYT spelling bee.  
  Not an LC problem, just thinking about this one.

  Given 6 letters and one "center letter", find all words in dictionary
  which are:
    1. include the center letter
    2. all other letters are some combo of the other 6 letters

  What word list to use? NYT has their own that changes, but seems reasonable to 
  start with scrabble list:
  https://boardgames.stackexchange.com/questions/38366/latest-collins-scrabble-words-list-in-text-file
=end

class SpellingBeeSolution
  attr_accessor :dict

  def self.create_trie_dict(txt_dict)
    trie = Trie.new
    File.foreach(txt_dict) do |line|
      word = line.chomp
      trie.add(word.upcase) unless word.length < 4 || word.include?(' ')
    end
    trie
  end

  def initialize(dict)
    @dict = dict
  end

  # letters must be upcase, LAST letter is CENTER letter
  # ex. ["H","K","A","E","L","B","C"] where center letter is "C"
  def valid_words(letters)
    center = letters[-1]
    out = []
    node = @dict.root
    queue = [node]
    next_queue = []
    until queue.empty?
      queue.each do |node|
        if node.terminal?
          word = node.full_state
          out.push(word) if word.include?(center)
        end
        letters.each do |char|
          child = node.walk(char)
          next_queue.push(child) unless child.nil?
        end
      end
      queue = next_queue
      next_queue = []
    end
    out
  end
end

# t = SpellingBeeSolution.create_trie_dict('collins_scrabble_words_2019.txt')
# t.save('collins_scrabble_words_2019_trie')

letters = ["H","K","A","E","L","B","C"]

t = Trie.read('collins_scrabble_words_2019_trie')
solution = SpellingBeeSolution.new(t)
valid_words = solution.valid_words(letters)
valid_words.each {|word| puts word}
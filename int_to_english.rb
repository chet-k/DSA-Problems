=begin
https://leetcode.com/problems/integer-to-english-words/
https://leetcode.com/submissions/detail/573404878/


Didn't realize this was rated LC-hard. IMO, one of the very few that is 
actually over-rated. The algo is easy, it's the tricks of implementation that 
can be a little tricky therefore just difficult to complete in a short time.
=end

# @param {Integer} num -> 32-bit integer required
# @return {String}

def number_to_words(num)
  return 'Zero' if num == 0
  level = 0
  scale_name = ['', 'Thousand', 'Million', 'Billion']
  #     'Trillion',
  #     'Quadrillion',
  #     'Quintillion',
  #     'Sextillion',
  #     'Septillion',
  #     'Octillion',
  #     'Nonillion'
  # ] # oops don't need these... 2^31 <<< 10^31 
  
  n = num
  words = []
  while n > 0
    chunk = n % 1000
    if chunk > 0
      words << scale_name[level] if level > 0
      words << hundreds_to_words(chunk)
    end
    level += 1
    n /= 1000
  end
  words.reverse.join(' ') #[0...-1] # exclude trailing space
end

def hundreds_to_words(num)
  under_ten = [
    'Zero',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine'
  ]
  under_twenty = [
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen'
  ]
  twenty_plus = [
    nil,
    nil, 
    'Twenty', 
    'Thirty', 
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety'
  ]
  
  dig_ones = num % 10
  dig_tens = (num / 10) % 10
  dig_hundreds = num / 100
  
  words = []
  words << under_ten[(num / 100).to_i] + ' Hundred' if num > 99
  
  n_tens = num % 100
  if n_tens > 0 
    if n_tens < 10
      words << under_ten[dig_ones]
    elsif n_tens < 20
      words << under_twenty[n_tens - 10]
    else
      words << twenty_plus[dig_tens]
      words << under_ten[dig_ones] if dig_ones > 0
    end
  end
  words.join(' ')
end
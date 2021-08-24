=begin
LC 537 Complex Number Multiplication
https://leetcode.com/problems/complex-number-multiplication/
https://leetcode.com/submissions/detail/543472056/

A complex number can be represented as a string on the form "real+imaginaryi" where:

real is the real part and is an integer in the range [-100, 100].
imaginary is the imaginary part and is an integer in the range [-100, 100].
i2 == -1.
Given two complex numbers num1 and num2 as strings, return a string of the complex number that represents their multiplications.

Example 1:

  Input: num1 = "1+1i", num2 = "1+1i"
  Output: "0+2i"
  Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert 
  it to the form of 0+2i.

Example 2:

  Input: num1 = "1+-1i", num2 = "1+-1i"
  Output: "0+-2i"
  Explanation: (1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i, and you need convert 
  it to the form of 0+-2i.
  

Constraints:

  num1 and num2 are valid complex numbers.
=end

# @param {String} num1
# @param {String} num2
# @return {String}
def complex_number_multiply(num1, num2)
  n1 = complex_str_to_i(num1)
  n2 = complex_str_to_i(num2)   

  terms = [ 
    n1[0] * n2[0],
    n1[1] * n2[0], 
    n1[0] * n2[1], 
    -n1[1] * n2[1] 
  ]
  
  real = terms[0] + terms[3]
  imag = terms[1] + terms[2]
  "#{real}+#{imag}i"
end

def complex_str_to_i(s_complex)
  n = s_complex.split("+")
  n[1].delete_suffix!("i")
  n.map { |s| s.to_i }
end
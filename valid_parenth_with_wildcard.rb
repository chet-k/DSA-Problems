# @param {String} s
# @return {Boolean}
require 'byebug'

#failed at finding a solution, trying to understand this one
# https://leetcode.com/problems/valid-parenthesis-string/discuss/107570/JavaC%2B%2BPython-One-Pass-Count-the-Open-Parenthesis

def check_valid_string(s)
    # think about fail condition! 

    #   so, track _minimum_ close parenths required with given lefts
    #   and _maximum_ close parenths required with given lefts
    #
    # TWO FAIL CONDITIONS:
    #   we run into a '(' before it's been opened.
    #   we have too many '(' for the rest of the ['(' + '*'] to close.
    #
    # Since we're reading right to left, keep tabs on the CLOSE parenthesis.
    # Track the range of possible outcomes. If we deviate from that, return false.
    # otherwise, we're within the possible range, return true.
    #
    # cmin: the MINIMUM remaining close parenths needed to the left ( '*' and ')' )
    #   (i.e., cmin considers each * as ')' BUT ONLY WHERE LEGAL)
    # cmax: the MAXIMUM remaining close parenths needed ( '*' and ')' )
    #   (i.e., cmax considers each * as '(', the outside limit on '('reqd)

    cmax, cmin = 0, 0
    s.each_char do |c|
        if c == "("
            # We will need a close parenth on this. It's given.
            # Add it to the tally in all scenarios.
            cmax += 1 
            cmin += 1 
        elsif c == ")"
            cmax -= 1 # this MUST close an open parenth or a *.
            #   remember cmax is counting the maximum remaining close pareths 
            #   required. We just closed a previous open, so decrement cmax 
            #   accoringly. If it goes below 0, that means even the worst-case
            #   scenario where ALL previous *'s are '(' aren't enough
            cmin = [cmin - 1, 0].max # this is the genius bit of logic. 
            #   if we CAN close a **previous** open parenth, do it (cmin -= 1). 
            #   but if we can't close we can't close a previous open (cmin = 0), 
            #   then we can't use it on a future open parenth either. so leave at 0
        else # c == '*'
            cmax += 1 # remember cmax is worst case required close parenths. In the
            # worst case, any * is an open parenth which will need to be closed later.
            cmin = [cmin - 1, 0].max # remember cmin is the lowest # of closed 
            #   parenths required. 
            #   IF LEGAL (i.e. if there are enough open parenths to the left, 
            #   i.e., if it doesn't send cmin below 0), treat this as a close 
            #   parenth, thus we don't need another close later.
        end
        return false if cmax < 0 # we went past our max allowable ')'
    end
    cmin == 0
end



# bad approach!! Could have seen this coming with all the if/else/ extra counters.
# def check_valid_string(s)
#     l_parenth, r_parenth, wc = 0, 0, 0
#     s.each_char do |c|
#         if c == "("
#             l_parenth += 1
#         elsif c == ")"
#             r_parenth += 1
#         else
#             wc += 1
#         end
#     end
    
#     wc_balance = l_parenth - r_parenth
#     return false if wc_balance.abs > wc
    
#     stack = []
#     unused_wc = 0
#     debugger
#     s.each_char do |c|
#         if c == "("
#             stack.push(c)
#         elsif c == ")"
#             if stack.length == 0 
#                 # debugger
#                 return false if unused_wc == 0
#                 unused_wc -= 1
#             else
#                 stack.pop
#             end
#         else # c == "*"
#             if wc_balance > 0 && stack.length > 0
#                 stack.pop
#                 wc_balance -= 1
#             elsif wc_balance < 0
#                 stack.push("(")
#                 wc_balance += 1
#             else
#                 unused_wc += 1
#                 wc_balance += 1
#             end
#         end
#     end
#     stack.empty?
# end

# s_to_check = "(((((*(((((*((**(((*)*((((**))*)*)))))))))((*(((((**(**)"
# s_to_check = "(((((*(()((((*((**(((()()*)()()()*((((**)())*)*)))))))(())(()))())((*()()(((()((()*(())*(()**)()(())"
# s_to_check = "((((()(()()()*()(((((*)()*(**(())))))(())()())(((())())())))))))(((((())*)))()))(()((*()*(*)))(*)()"
# s_to_check = "*****)(*)(((**(*)))(*)"


# puts check_valid_string(s_to_check)
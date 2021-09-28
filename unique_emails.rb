=begin
https://leetcode.com/problems/unique-email-addresses/
https://leetcode.com/submissions/detail/562097145/
=end

# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
  count = 0
  names_at = Hash.new {|h, k| h[k] = Array.new}
  emails.each do |eml|
    name, domain = eml.split('@')
    names_at[domain].push(clean_local(name))
  end
  names_at.values.each { |arr| count += Set.new(arr).size }
  count
end

def clean_local(localname)
  name = []
  localname.each_char do |c|
    break if c == '+'
    name.push(c) unless c == '.'
  end
  name.join('')
end
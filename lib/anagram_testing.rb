# Find variations of ordering the letyters of single words. Look up each variation in a dictionary (hash). If a variation is found, then it is an anagram.
# Finding the spelling permutations is beyoind my capabilities taught at this point in the course. From research I have found a permutation function which I display below. For this project, however, I have created a hash (dictionary) of anagrams of "ruby" and a few of its synonyms. I have made this project mainly an exercise in using hashes to find out the available anagrams for the ruby synonyms. 
# Since a hash takes only one value for any unique key, the value has been entered as an array in order that it can hold more than one anagram. 

def anagrams(word)
  # anagrams of some "ruby" synonyms (up to three each)
  anagrams = {
    "ruby" =>   ["bury", nil, nil],
    "rose" =>   ["ores", "roes", "sore"],
    "claret" => ["rectal", "coral", nil],
    "russet" => ["surest", "estrus", nil]
  }

  puts "\n"
  if not anagrams.keys.include?(word)
    puts "#{word} has no anagrams"
  else
    puts "#{word} has this/these anagrams:"
    puts "\n"
    puts "#{anagrams[word][0]}"
    puts "#{anagrams[word][1]}"
    puts "#{anagrams[word][2]}"
    # Note. If value is nil, nothing is printed
  end
puts "\n"
end

# End


# Main program

anagram_word = ""
print "\n"
puts "A list of anagrams of 'ruby' and a few of its synonyms is available. These are:"
puts "(1) ruby (2) rose (3) claret (4) russet (5) wine"
print "\n"
print "Enter one of these to obtains its anagrams: "
anagram_word = gets.chomp.to_s
anagrams(anagram_word)

# End

# ****************************************

=begin

Permutations function. 
----------------------

Source: http://ebanshi.cc/questions/1596460/find-all-the-possible-permutations-using-ruby-and-recursion 

def permutation(string)
  return [string] if string.size < 2
  ch = string[0]
  permutation(string[1..-1]).each_with_object([]) do |perm, result|
    (0..perm.size).each { |i| result << perm.dup.insert(i,ch) }
  end
end

Examples
--------
permutation("ab")
  #=> ["ab", "ba"]
permutation("abc")
  #=> ["abc", "bac", "bca", "acb", "cab", "cba"]
permutation("abcd")
  #=> ["abcd", "bacd", "bcad", "bcda", "acbd", "cabd",
  #    "cbad", "cbda", "acdb", "cadb", "cdab", "cdba",
  #    "abdc", "badc", "bdac", "bdca", "adbc", "dabc",
  #    "dbac", "dbca", "adcb", "dacb", "dcab", "dcba"] 

=end

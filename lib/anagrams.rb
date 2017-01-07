def anagrams(str, anagrams)
  raise ArgumentError unless str.is_a?(String) && anagrams.is_a?(Array)
  str = str.split('').sort
  matches = anagrams.select do |word|
    str == word.split('').sort
  end
  matches.map{ |word| word.upcase }
end

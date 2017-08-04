def anagrams(search_word, dictionary)
  result = dictionary.select do |word|
             search_word.chars.sort == word.chars.sort
           end

  result.map(&:upcase)
end

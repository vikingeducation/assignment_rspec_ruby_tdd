def anagrams(word)
  if word.class == String
    []
    # @dictionary.select { |entry| are_these_anagrams?(word, entry)}
  else
    raise 'This method only works on strings!'
  end
end

def are_these_anagrams?(word1,word2)
end
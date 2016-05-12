def anagrams(word, dictionary)
  raise ArgumentError if !word.is_a?(String)
  raise ArgumentError if dictionary.none? { |word| word.is_a?(String) }

  anagrams = []

  dictionary.each do |entry|
    anagrams << entry.upcase if word.upcase.split("").sort.join("") == entry.upcase.split("").sort.join("")
  end
  anagrams
end

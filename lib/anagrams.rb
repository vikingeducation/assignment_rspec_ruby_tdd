def anagrams(word)
  raise("input is not a string") unless word.is_a?(String)
  raise("input must be one word") if word.include?(" ")

  dictionary = IO.read("dictionary.txt")
  dictionary.map! { |element| element.strip }

  anagrams = []
  word = word.split("").to_a
  word.permutation.to_a.each do |test_word|
    if (dictionary.include?(test_word.join)) && (word != test_word) && !anagrams.include?(test_word.join)
      anagrams << test_word.join
    end
  end

  anagrams

end
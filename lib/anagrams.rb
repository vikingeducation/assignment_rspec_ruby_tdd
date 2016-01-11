def anagrams(word, array)
  raise ArgumentError.new("Please input a string") unless word.is_a?(String)
  raise ArgumentError.new("Please input a word") if word.length == 0
  raise ArgumentError.new("Dictionary must be an array") unless array.is_a?(Array)

  word_letters = word.upcase.split("")
  word_anagrams = []

  array.each do |dictionary_word|
    dictionary_letters = dictionary_word.chomp.split("")
    word_anagrams << dictionary_word if word_letters - dictionary_letters == [] && word.upcase != dictionary_word
  end
  word_anagrams
end
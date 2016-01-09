def anagrams(word)
  raise ArgumentError.new("Please input a string") unless word.is_a?(String)
  raise ArgumentError.new("Please input a word") if word.length == 0

  word_letters = word.upcase.split("")
  word_anagrams = []

  File.readlines.each do |dictionary_word|
    dictionary_letters = dictionary_word.chomp.split("")
    word_anagrams << dictionary_word if word_letters - dictionary_letters == [] && word.upcase != dictionary_word
  end
  word_anagrams
end
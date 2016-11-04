def anagrams(word, dictionary)
	raise ArgumentError unless word.is_a? String
  raise ArgumentError unless dictionary.is_a? Array
  raise "Please enter one word only" if word.include?(" ")
  
  anagrams = []

  dictionary.each do |dict_word|
    if dict_word.upcase.chars.sort == word.upcase.chars.sort
      anagrams << dict_word.upcase
    end
  end
  anagrams
end

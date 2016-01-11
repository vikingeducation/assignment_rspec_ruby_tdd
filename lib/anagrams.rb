def anagrams(string)

	raise ArgumentError if !string.is_a?(String)

	file = File.open("enable.txt","r")
  dictionary = file.readlines
  file.close

	#obtains ordered set of characters of anagram
	char_set = string.split("").sort.join.upcase

	#search dictionary for words of same length
	same_length_words = dictionary.select { |word| word.length == char_set.length }

	#iterate through possible words for same set of letters
	result = same_length_words.select do |test_word|
		test_word.chars.sort.join == char_set
	end

	#remove input word
	result.delete(string.upcase)

	return result
end

# Anagram method
def anagram(word)
	raise ArgumentError, "Too many words" unless word.split().length == 1
	raise ArgumentError, "Invalid input" unless word.is_a?(String)

	has_anagrams? ? get_anagrams : []

end
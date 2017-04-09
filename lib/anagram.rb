def anagram(word, arr)
	raise "Error" if !word.is_a?(String)
	raise "Error" if !arr.is_a?(Array)

	anagrams = []

	arr.each do |entry|
		anagrams.push(entry) if (word.downcase.split('').sort == entry.downcase.split('').sort)
  end
  anagrams
end
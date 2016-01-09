def anagrams(string)

	raise ArgumentError if !string.is_a?(String)

	file = File.open("enable.txt","r")
  dictionary = file.readlines
  file.close
  
	# text = "file\nlife\nfiel\nlief\nifle\ngram\nbob\nmom"
	# file = File.open(text)
	# dictionary = file.readlines
	# file.close

	word = string.split('')
	arr = []
	dictionary.each do |word|
		word.each do |letter|
			if word.include?(letter)
				arr << word
			end
		end
	end
end
def anagrams(string)

	raise ArgumentError if !string.is_a?(String)

	file = File.open("enable.txt","r")
  dictionary = file.readlines
  file.close

	word = string.split('')


end

def anagrams(string)
	raise 'Not a string' unless string.is_a?(String)
	results = []
	File.readlines('dictionary.txt').each do |l|
		sorted_string = string.chars.sort.join
		sorted_line = l.gsub("\n", '').chars.sort.join
		results << l.upcase if sorted_string == sorted_line
	end
	results
end
require 'pry'

def find( string, arr )

	raise "Enter valid args" unless string.is_a?( String ) && arr.is_a?( Array )

	anagrams = []
	array = arr.join.split(", ")

	array.each do |x|

		anagrams << x if string.chars.sort.join == x.chars.sort.join

	end

	if anagrams == []

		raise "No anagrams!"

	else

  	return anagrams.map{ |x| x.upcase }

  end

end


# Anagram method
class Anagram
	def anagram(word)
		if is_valid?(word)
			has_anagram?(word) ? get_anagram(word) : []
		else
			raise Argument Error, "Invalid input"
		end
	end

	def has_anagram?(word)
		false
	end

	def get_anagram(word)
		[]
	end

	def is_valid?(word)
		if word.split().length != 1
			false
		else
			true
		end
	end

end
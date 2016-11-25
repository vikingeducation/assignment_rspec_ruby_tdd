class Anagrams
  
  def anagrams(word, dictionary)
    matched_array = []
    char_array = word.upcase.chars.sort
    dictionary.each do |word|
      temp = word.upcase.chars.sort
      if char_array == temp
        matched_array << word.downcase
      end
    end
      matched_array
  end
end

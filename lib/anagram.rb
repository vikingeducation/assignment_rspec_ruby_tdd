def anagrams(search_word, dictionary)
  result = dictionary.select do |word|
             search_word.chars.sort == word.chars.sort
           end

  result.map(&:upcase)
end

def anagrams_from_file(search_word, file_path)
  return [] unless File.exist?(file_path)
  dictionary = File.readlines(file_path)
  dictionary.map { |word| word.sub! "\n", '' }

  anagrams(search_word, dictionary)
end

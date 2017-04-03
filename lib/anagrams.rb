class Anagram
  def anagram_finder(word_input, dictionary = open_dictionary)
    raise ArgumentError, "Must enter a string" unless word_input.is_a? String
    word_dictionary = dictionary.map(&:upcase)
    input = word_input.upcase
    anagrams = []
    possible_words = input.split('').permutation.map { |split_word| split_word.join('') }
    possible_words.each do |word|
      anagrams << word if word_dictionary.include?(word) && word != input
    end

    anagrams.uniq.sort
  end

  def open_dictionary
    text = File.readlines('./lib/enable.txt').map(&:chomp)
    text
  end
end

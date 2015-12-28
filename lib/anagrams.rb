class Anagram
  def anagrams(string)
    raise ArgumentError, 'Argument must be a one word string' unless ((string.is_a? String) && (string.split(" ").count == 1))
    file = File.open("enable.txt", "r")
    contents = file.read
    dictionary = contents.split
    anagram_words = []
    alphabetical_order_letters_of_argument_upcased = string.upcase.split('').sort
    dictionary.each do |word|
      alphabetical_order_letters_of_word = word.split('').sort
      if alphabetical_order_letters_of_word == alphabetical_order_letters_of_argument_upcased
        anagram_words << word
      end
    end
    anagram_words
  end
end
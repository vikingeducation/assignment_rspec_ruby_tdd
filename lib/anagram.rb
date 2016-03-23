def anagram(word, dictionary = nil)
  if dictionary.nil?
    dictionary = []
    f = File.readlines("enable.txt")
    f.each do |line|
      dictionary << line.chomp
    end
  end

  solution = []
  dictionary.each do |dic_word|
    dic_word = dic_word.upcase
    word_test = word.upcase.split("")
    if word_test.include?(dic_word[0]) && dic_word != word.upcase && dic_word.length == word.length
      (0...dic_word.length).each do |char|
        if word_test.include?(dic_word[char])
          word_test.delete_at(word_test.index(dic_word[char]))
        else
          break
        end
      end
    end
    solution << dic_word if word_test.length == 0
  end
  solution
end


def anagram word = "", dictionary = []
  warning = 'Wrong input, input should be a word'
  raise warning unless word.is_a? String
  raise warning if word.empty?
  return warning if word.split(" ").length > 1
  sorted_word = word.upcase.split("").sort
  dictionary.select do |dic|
    dic.upcase!.split("").sort == sorted_word
  end
end

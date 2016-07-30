def anagram word = "", dictionary = nil
  warning = 'Wrong input, input should be a word'
  raise warning unless word.is_a? String
  raise warning if word.empty?
  return warning if word.split(" ").length > 1
  dictionary ||= File.readlines('/home/bran/Desktop/assignment_rspec_ruby_tdd/lib/dictionary.rb', 'r')
  sorted_word = word.upcase.split("").sort
  dictionary.select do |dic|
    dic.upcase!.split("").sort == sorted_word
  end
end

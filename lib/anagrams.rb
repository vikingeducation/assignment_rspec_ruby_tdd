def anagrams(string, dict_array)
  raise "Please submit only one word." if string.include?(" ")
  broken_down_string = string.split("").sort

  anagrams = []

  dict_array.each do |word|
    broken_down_word = word.split("").sort
    anagrams << word if broken_down_word == broken_down_string
  end

  anagrams
end
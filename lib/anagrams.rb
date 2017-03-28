def anagrams(word, dictionary_array)
  sorted_input = word.split("").sort
  anagrams_array = Array.new

 dictionary_array.length.times do |i|
    dictionary_word_array = dictionary_array[i].strip.split("")
    if sorted_input[sorted_input.length - 1] < dictionary_word_array[0]
      break
    else
      dictionary_word_sorted = dictionary_word_array.sort
      if dictionary_word_sorted == sorted_input && dictionary_array[i].strip != word
          anagrams_array.push(dictionary_array[i])
      end
    end
  end
return anagrams_array
end

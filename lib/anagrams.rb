def anagrams(word, dictionary)
  raise ArgumentError unless word.is_a?(String) && dictionary.is_a?(Array)
  raise ArgumentError, "Must be one word!" unless (/\s/ =~ word) == nil

  word_combinations = word.split("").permutation.to_a
    .map{ |word| word.join }.uniq

  word_combinations.shift

  word_combinations.select { |word| dictionary.include?(word) }.sort
  
end

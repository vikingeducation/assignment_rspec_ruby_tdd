def anagrams(str, arr)
  anagrams = []
  n_str = str.chars.sort
  arr.each do |word|
    if word.chars.sort == n_str
      anagrams << word
    end
  end
  anagrams
end

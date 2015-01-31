def anagrams word
  if (!word.kind_of?(String))
    raise TypeError
  end
  word
end
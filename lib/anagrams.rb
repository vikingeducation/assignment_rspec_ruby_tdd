def anagrams(word)
  raise ArgumentError unless word.is_a?(String)
  raise ArgumentError if word.include?(" ")

  dict = IO.read("dict.txt")
  dict.map! { |i| i.strip }

  anagrams = []
  word = word.split("").to_a
  word.permutation.to_a.each do |v|
    if dict.include?(v.join) && word != v &&
       !anagrams.include?(v.join) 
        anagrams << v.join 
    end
  end

  return anagrams
end
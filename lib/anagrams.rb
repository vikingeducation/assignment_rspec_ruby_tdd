def anagrams(word, dict)
  throw ArgumentError if !dict.is_a?(Array)
  throw ArgumentError if !word.is_a?(String)
  throw ArgumentError if word.empty? || dict.empty?
  ans = []
  dict.each do |entry|
    ans.push(entry) if (word.downcase.split('').sort == entry.downcase.split('').sort)
  end
  ans
end

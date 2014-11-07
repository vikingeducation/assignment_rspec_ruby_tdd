def anagram(word)
  raise ArgumentError, "Must use a string" unless word.is_a?(String)
  word = word.split(' ').first.upcase
  anagrams = []
  File.open('TWL06.txt').each do |entry|
    if entry.strip.split('').sort == word.split('').sort && entry.strip != word
      anagrams << entry.strip
    end
  end
  anagrams
end
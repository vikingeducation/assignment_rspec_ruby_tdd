def anagrams(string)
  # Load dictionary
  # Can compress - check if length equal first then if sorted word equals sorted current word in dictionary
  alpha_string = string.chars.sort.join
  anagrams = []
  File.readlines("enable.txt").each do |readline|
    r = readline.chomp
    anagrams << r.upcase if r.chars.sort.join == alpha_string
  end

  anagrams.delete(string.upcase)
  anagrams
end

# puts anagrams("pears").to_s
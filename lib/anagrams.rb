# anagrams

def anagrams(str)

  unless str.is_a?(String)
    raise RuntimeError
  end

  dict = IO.readlines("lib/enable.txt")

  result = []

  dict.each do |word|
    next if word.chomp.length != str.length 
    if str.split("").sort == word.chomp.split("").sort
      result << word.chomp.upcase 
    end
  end

  result.sort

end


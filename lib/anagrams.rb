
def anagrams(word)

  raise "Input not a string" if word.class != String
  raise "String must be only one world" if word.include?(" ")

  output = []

  test = word.split("").sort.join("")
  
  arr = IO.readlines("./lib/enable.txt")

  arr.each do |w|
    if w.strip.split("").sort.join("") == test && w.strip != word
      output << w.strip.upcase
    end
  end

  output

end
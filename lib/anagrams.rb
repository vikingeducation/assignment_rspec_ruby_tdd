require 'pry-byebug'
def anagrams(string="dog", library = ["DOG","GOD"])

  result=[]
  letters = string.upcase.split("")
  letters.sort!

  raise ArgumentError if (/\d/.match(string))

  raise ArgumentError if letters.include?(" ")

  library.each do |word|

    word_array = word.split("").sort!

    if (letters == word_array)
      result << word
    end
  end
  return result


end

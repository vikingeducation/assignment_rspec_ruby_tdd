class Anagrams

  def anagrams(string)

    raise ArgumentError unless string.is_a? String
    raise ArgumentError if string.include?(" ")


    result = []

    file = File.open("words.txt", "r")
    dictionary = file.readlines

    letters = string.downcase.chars.sort.join
    dictionary.each do |match|
      if match.downcase.chomp.chars.sort.join == letters
        result << match.chomp.upcase
      end
    end
    result -=  [string.upcase]
  end



end


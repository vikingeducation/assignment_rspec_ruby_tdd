

class Anagram
  def ana(my_str,file)
    raise("String not passed") if not my_str.is_a? String 

 
    word_array = []

    #file = File.open("../lib/enable.txt", "r")

    dictionary = file.readlines

    dictionary.each do |word|
      if  word.length == my_str.length &&\
          word.split(//).sort.pop(my_str.length).join('') == my_str.split(//).sort.join('')
          word_array << word.split("\n").join
      end
    end
    return word_array - [my_str]
  end  

end 

#game = Anagram.new
#game.ana("zygote")
class Anagram
   attr_accessor :words, :dictSelect
    
    def initialize(words)
        @words = words
        @dictSelect = []
    end
    
    def formalizself
        @words = @words.downcase.chars.sort.join()
    end
    
    def formalize(word)
        form = word.downcase.chars.sort.join()
        form
    end
    
    def collect(array)
        array.each do |singword|
            puts(singword)
            @dictSelect.push(singword) if formalize(singword) == @words
        end
    end
    
    
end
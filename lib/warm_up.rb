#
# > stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])
# #=> [2, 6]
def stock_picker(stocks)
	raise "You are suck, use array!" unless stocks.is_a? Array
	raise "You are a sock, use numbers!" unless stocks.all? {|num|num.is_a? Numeric}

  buy = 0
  sell = 0
  difference = 0

  stocks.each_with_index do |first_number, first_index|
    first_index.upto(stocks.size - 1 ) do |second_index|
      second_number = stocks[second_index]

      if second_number - first_number > difference
        difference = second_number - first_number
        buy, sell = first_index, second_index
      end

    end
  end

  [buy, sell]

end

def anagram(word)
  raise "This doesn't work with spaces, breh!" unless word.split(" ").length == 1

  word.upcase!
  letter_count = frequency(word)

  anagrams = []
  File.open('TWL06.txt').each do |line|
    if letter_count == frequency(line.strip)
      anagrams << line.strip unless line.strip == word
    end
  end
  anagrams
end

def frequency(word)
  array = Hash.new(0)
  word.chars.each do |char|
    array[char.upcase] += 1
  end
  array
end


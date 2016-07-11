def stock_picker(prices)
  raise ArgumentError unless prices.class == Array
  raise ArgumentError unless prices.length > 1

  results = [0, 1]
  highest_profit = prices[1] - prices[0]
  prices.each_index do |first_day|
    (first_day + 1...prices.length).each do |second_day|
      profit = prices[second_day] - prices[first_day]
      if profit > highest_profit
        results[0] = first_day
        results[1] = second_day
        highest_profit = profit
      end
    end
  end 
  return results
end

def anagrams(word, dict = nil)
  dict = load_dictionary("fake_dict.txt") unless dict
  raise ArgumentError unless word.class == String
  raise ArgumentError unless dict.class == Array

  results = []
  dict.each do |dict_word|
    if word.downcase.split('').sort == dict_word.downcase.split('').sort
      results << dict_word unless word == dict_word
    end
  end
  results
end

def load_dictionary(filename)
  dict = []
  dict_file = File.new(filename, "r")
  
  dict_file.each_line do |line|
    dict << line.chomp
  end

  dict_file.close
  dict
end
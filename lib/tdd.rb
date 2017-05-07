# 1 StockPicker

def stock_picker(input)
  raise(ArgumentError) unless input.is_a?(Array)
  a = input
  output = []
  profit = 0
  (0..a.length).to_a.each do |buy_day|
    (buy_day..(a.length-1)).to_a.reverse_each do |sell_day|
      if a[sell_day] > a[buy_day] && (a[sell_day] - a[buy_day]) > profit
        profit = a[sell_day] - a[buy_day]
        output = [(buy_day  + 1), (sell_day + 1)]
      end
    end
  end
  raise(ArgumentError) if profit == 0
  output
end

# 2 anagrams
# anagrams("looter", %w(spooky retool rootle tooler toddler))
# ["RETOOL", "ROOTLE", "TOOLER"]
# anagrams("zygote", %w(spooky retool rootle tooler toddler))
# []
def anagrams(input, dic)
  raise(ArgumentError) unless input.is_a?(String)
  anagram = String.new
  output = []
  dic.each do |dic_word|
    if dic_word.split(//).sort == input.split(//).sort
      output << dic_word.upcase
    end
  end
  output
end



class TestDrivenDevelopment
  
  def stock_picker(arr)
    profit = 0
    ans = []
    arr.each_with_index do |price,index|
      for i in (index+1)...arr.length
          next if price > arr[i]
           temp_profit = arr[i] - price
           if temp_profit  > profit 
               ans = [index, i] 
               profit = temp_profit
           end
      end
    end
    return ans
  end
  
  def anagrams(string)
    return_array=[]
    dictionary = File.readlines("anyfilename.txt")
    string.downcase!
    string.strip!
    dictionary.each do |line|  
      if string.chars.sort == line.chars.sort
        return_array.push(line)
      end
    end
    return_array
  end


end
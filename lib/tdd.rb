class TestDrivenDevelopment
  def stock_picker(arr)
    profit = 0
    ans = []
    arr.each_with_index do |price,index|
      for i in (index+1)...arr.length

           temp_profit = arr[i] - price
           if temp_profit  > profit 
               ans = [index, i] 
               profit = temp_profit
           end
      end
    end
    return ans
  end
  
end
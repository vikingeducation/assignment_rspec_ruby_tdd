def stock_picker(stock_array)

  raise "Not an Array" unless stock_array.class == Array

  
  profit=0;  
  pair=[];
    0.upto(stock_array.length-1) do |n|
      (n+1).upto(stock_array.length-1) do |m|
        
        if profit < stock_array[m] - stock_array[n]
          profit=stock_array[m] - stock_array[n]
          puts pair=[n,m]
        end
      end
    end
    pair

  
end
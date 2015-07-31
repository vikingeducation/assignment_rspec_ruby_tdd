class Stock_pick
   attr_accessor :dailyValue, :dailyHash, :hashSort
   
   def assign(array)
       @dailyValue = array
       @dailyHash = sortIntoHash(array)
   end
   
   def sortIntoHash(array)
       hash = Hash[array.map.with_index { |value, index| [index, value] }]
       hash
   end
   
   def hashsort(hash)
       @hashSort = hash.sort{|day1, day2| day1[1]<=>day2[1]}
   end
   
   def hashClean(array)
       out = [].push(array[0])
       1.upto(array.length - 1) do |i|
           out.push(array[i]) unless out[out.length - 1][1] == array[i][1]
       end
       out
   end
   
   def compare(day1, day2)
       return [day1[0],day2[0]] if (day2[0] > day1[0])
       return -1
   end
   
   def getdate(array)
       
       dateCheck = -1
       index = array.length - 1
       loop do
        0.upto(index-1) do |i|
            dateCheck = compare(array[i], array[index])
            return dateCheck unless dateCheck == -1
            end
        index -= 1
        if index == 0
            puts "you will not get any profit starts from any day"
            return ([0,0]) 
        end
        end
   end
   
   def pick(array) 
       
       picker = Stock_pick.new
       return ([0,0]) if array.uniq.length == 1
       picker.assign(array)
       picker.hashSort = picker.hashsort(picker.dailyHash)
       hashfinal = picker.hashClean(picker.hashSort)
       picker.getdate(hashfinal)
       
   end
   
end
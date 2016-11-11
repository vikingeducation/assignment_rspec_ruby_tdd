def stockpicker(arr)
  raise ArgumentError if !arr.is_a?(Array)
  raise ArgumentError if arr.length < 2
  arr.each {|x| raise ArgumentError if !x.is_a?(Integer)}
  pair = [0,1]
  arr.length.times do |x|
    arr.length.times do |y|
      if x<y
        if arr[y]-arr[x] > arr[pair[1]]-arr[pair[0]]
          pair[0] = x
          pair[1] = y
        end
      end
    end
  end

  pair


end

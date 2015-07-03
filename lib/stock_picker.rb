
def stock_picker(array=[0,0])
  if array == [0,0]
    puts "Enter your prices:" # 43,24,565
    array = gets.chomp.split(",")
  end

  if array.length < 2
    raise "ArgumentError"
  else


  # array.each do |price|
  #   initial =


  # end
  end
end
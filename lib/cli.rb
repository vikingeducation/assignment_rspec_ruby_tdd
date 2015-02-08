class CLI
  def take_turn
    print "Take a tile from which stack?\nL, C, or R? > "
    from = gets.chomp.downcase.to_sym
    print "Move the tile to which stack?\nL, C, or R? > "
    to = gets.chomp.downcase.to_sym
    if [from,to].include? :q
      puts "goodbye!"
      exit
    end
    {from: from, to: to}
  end
end
class Listener

  def self.get_input
    input = gets.strip
    return if ["q", "quit", "exit"].include?(input.downcase)
    input.to_i
  end

end
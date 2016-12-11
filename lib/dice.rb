class Dice
  def self.roll(number=1)
    sum = 0
    number.times { sum += rand(1..6) }
    sum
  end
end
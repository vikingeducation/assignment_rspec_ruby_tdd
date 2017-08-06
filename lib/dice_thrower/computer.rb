module DiceThrower
  class Computer < Player
    def initialize
      super set_random_name
    end

    private

    def set_random_name
      %w(RW4596 SQ4244 LA24423 WWDDDD).sample
    end
  end
end

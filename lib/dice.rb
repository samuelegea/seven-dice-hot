class Dice
  attr_accessor :dice, :times

  def initialize(dice_string)
    @dice = dice_string.split('d').last.to_i
    @times = dice_string.split('d').first.to_i
  end

  def to_s
    "#{times}d#{dice}"
  end

  def roll(advantage: false, disadvantage: false, lucky: false)
    rolls = (1..times).map do
      if advantage || disadvantage
        r1 = rand(dice) + 1
        r2 = rand(dice) + 1
        p r1, r2
        advantage ? [r1, r2].max : [r1, r2].min
      else
        rand(dice) + 1
      end
    end
    rolls << rand(dice) + 1 if lucky
    rolls
  end

  def sum_roll(advantage: false, disadvantage: false, lucky: false)
    roll(advantage:, disadvantage:, lucky:).sum
  end
end

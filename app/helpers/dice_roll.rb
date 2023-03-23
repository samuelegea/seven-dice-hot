class DiceRoll
  attr_accessor :dice, :times, :advantage, :disavantage , :lucky

  def initialize(dice: 20, times: 1, advantage: false, disadvantage: false, lucky: false)
    @dice = dice
    @times = times
    @advantage = advantage
    @disadvantage = disadvantage
    @lucky = lucky
  end
  
  def roll
    rolls = [..(times - (lucky ? 0 : 1))].map do 
      if advantage || disadvantage
        r1 = rand(dice) + 1
        r2 = rand(dice) + 1
        advantage ? max(r1, r2) : min(r1,r2)
      else
        rand(dice) + 1
      end
    end
  end
end

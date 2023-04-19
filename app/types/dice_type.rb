class DiceType < ActiveModel::Type::Value
  def cast(value)
    value
  end

  def serialize(value)
    value.to_s
  end

  def deserialize(value)
    Dice.new(value)
  end
end

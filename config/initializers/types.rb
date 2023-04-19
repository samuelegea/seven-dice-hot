require_relative '../../app/types/dice_type'

ActiveRecord::Type.register(:dice_type, DiceType)

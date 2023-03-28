class ItemsController < InheritedResources::Base

  private

    def item_params
      params.require(:item).permit(:name, :desc, :category, :weapon_category, :weapon_range, :cost_cp, :damage, :damage_type, :range_normal, :range_long, :weight, :properties, :throw_range_normal, :throw_range_long, :two_handed_damage, :two_handed_damage_type, :custom, :armor_category, :armor_class, :ac_dex_bonus, :max_bonus, :str_minimum, :stealth_disadvantage, :gear_category, :tool_category, :vehicle_category, :speed_unit, :speed, :capacity)
    end

end

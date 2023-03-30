ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :desc, :category, :weapon_category, :weapon_range, :cost_cp, :damage, :damage_type, :range_normal, :range_long, :weight, :properties, :throw_range_normal, :throw_range_long, :two_handed_damage, :custom, :armor_category, :armor_class, :ac_dex_bonus, :max_bonus, :str_minimum, :stealth_disadvantage, :gear_category, :tool_category, :vehicle_category, :speed_unit, :speed, :capacity, :two_handed_damage_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :desc, :category, :weapon_category, :weapon_range, :cost_cp, :damage, :damage_type, :range_normal, :range_long, :weight, :properties, :throw_range_normal, :throw_range_long, :two_handed_damage, :custom, :armor_category, :armor_class, :ac_dex_bonus, :max_bonus, :str_minimum, :stealth_disadvantage, :gear_category, :tool_category, :vehicle_category, :speed_unit, :speed, :capacity, :two_handed_damage_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

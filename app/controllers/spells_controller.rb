class SpellsController < InheritedResources::Base

  private

    def spell_params
      params.require(:spell).permit(:name, :desc, :school, :components, :material, :ritual, :duration_number, :duration_unit, :duration_delimiter, :concentration, :casting_time_unitt, :casting_time_number, :level, :attack_type_melee, :saving_throw, :dc_success, :dc_desc, :aoe_type, :aoe_size)
    end

end

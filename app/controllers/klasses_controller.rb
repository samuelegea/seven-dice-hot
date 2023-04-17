class KlassesController < InheritedResources::Base

  private

    def klass_params
      params.require(:klass).permit(:name, :hit_die, :spellcasting_level, :spellcasting_ability, :prerequisites)
    end

end

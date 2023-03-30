class WeaponPropertiesController < InheritedResources::Base

  private

    def weapon_property_params
      params.require(:weapon_property).permit(:name, :desc, :properties)
    end

end

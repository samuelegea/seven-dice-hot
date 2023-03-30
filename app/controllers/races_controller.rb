class RacesController < InheritedResources::Base

  private

    def race_params
      params.require(:race).permit(:name, :desc, :speed, :size)
    end

end

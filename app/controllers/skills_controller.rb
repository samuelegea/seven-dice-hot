class SkillsController < InheritedResources::Base

  private

    def skill_params
      params.require(:skill).permit(:name, :desc, :ability_score)
    end

end

class TraitsController < InheritedResources::Base

  private

    def trait_params
      params.require(:trait).permit(:name, :desc, :properties)
    end

end

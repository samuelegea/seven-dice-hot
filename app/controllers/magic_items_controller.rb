class MagicItemsController < InheritedResources::Base

  private

    def magic_item_params
      params.require(:magic_item).permit(:name, :category, :rarity, :variant, :variant_of_id, :desc, :properties)
    end

end

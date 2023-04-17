ActiveAdmin.register Proficiency do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :skill_id, :item_id, :equipment_category_id, :name, :ability_score
  #
  # or
  #
  # permit_params do
  #   permitted = [:skill_id, :item_id, :equipment_category_id, :name, :ability_score]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column :id
    column :name
    column :skill
    column :item
    column :equipment_category

    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  filter :name
  filter :skill
  filter :item
  filter :equipment_category

end

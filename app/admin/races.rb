ActiveAdmin.register Race do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :desc, :speed, :size]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :desc, :speed, :size

  index do
    selectable_column
    id_column
    column :name
    column :desc
    column :speed
    column :size
    column :proficiencies

    actions
  end

  filter :name
  filter :desc
  filter :speed
  filter :size
  filter :proficiencies
end

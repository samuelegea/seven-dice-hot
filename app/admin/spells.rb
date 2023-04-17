ActiveAdmin.register Spell do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :desc, :school, :components, :material, :ritual, :duration_number, :duration_unit, :duration_delimiter, :concentration, :casting_time_unit, :casting_time_number, :level, :attack_type_melee, :saving_throw, :dc_success, :dc_desc, :aoe_type, :aoe_size, :ability_score
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :desc, :school, :components, :material, :ritual, :duration_number, :duration_unit, :duration_delimiter, :concentration, :casting_time_unit, :casting_time_number, :level, :attack_type_melee, :saving_throw, :dc_success, :dc_desc, :aoe_type, :aoe_size, :ability_score]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column 'Name' do |spell|
      link_to spell.name, admin_spell_path(spell)
    end
    column :level
    column :school
    column :components
    column :material
    column :ritual
    column :duration
    column :concentration
    column :casting_time
    column 'Melee', :attack_type_melee
    column :saving_throw
    column :dc_success
    column :dc_desc
    column :aoe_type
    column :aoe_size

    actions
  end
end

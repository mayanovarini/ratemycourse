ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  sidebar "Details", only: [:show, :edit] do
    ul do
      li link_to "Reviews",    admin_course_path(resource)
    end
  end

 permit_params :code, :name, :department
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  filter :code
  filter :name
  filter :department
end

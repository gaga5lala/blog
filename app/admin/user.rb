ActiveAdmin.register User do
  permit_params :email, :username
  
  index do
    selectable_column
    id_column
    column :email
    column :username
    column :current_sign_in_at
    column :updated_at
    actions
  end

  filter :current_sign_in_at
  filter :updated_at
end

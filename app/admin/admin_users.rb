ActiveAdmin.register AdminUser do
  menu if: proc{ current_admin_user.role=="admin" }  

  scope :all
  scope :admin
  scope :seller

  permit_params :name, :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: ['admin','seller']
    end
    f.actions
  end

end

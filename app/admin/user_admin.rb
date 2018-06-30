module UserAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 1
      list do
        field :id
        field :name
        field :email
        field :company
        field :role
      end
      edit do
        field :name
        field :email
        field :password
        field :company
        field :role
      end
      show do
        field :id
        field :name
        field :email
        field :company
        field :role
      end
    end
  end
end
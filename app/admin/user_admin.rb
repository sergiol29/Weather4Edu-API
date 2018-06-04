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
        field :password
        field :company
      end
      edit do
        field :name
        field :email
        field :password
        field :company
      end
      show do
        field :id
        field :name
        field :email
        field :company
      end
    end
  end
end
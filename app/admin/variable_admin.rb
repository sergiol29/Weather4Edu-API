module  VariableAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 8
      list do
        field :id
        field :code
      end
      edit do
        field :code
      end
      show do
        field :id
        field :code
      end
    end
  end
end
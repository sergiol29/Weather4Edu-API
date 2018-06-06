module  VariableAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 7
      list do
        field :code
        field :name
        field :symbol
      end
      edit do
        field :code
        field :name
        field :symbol
      end
      show do
        field :code
        field :name
        field :symbol
      end
    end
  end
end
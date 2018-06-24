module  VariableAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 8
      list do
        field :code
        field :name
        field :symbol
        field :user_id do
          pretty_value do
            User.find(bindings[:object].user_id).name
          end
        end
      end
      edit do
        field :code
        field :name
        field :symbol
        field :user_id, :enum do
          enum do
            User.all.collect {|p| [p.name, p.id]}
          end
        end
      end
      show do
        field :code
        field :name
        field :symbol
        field :user_id do
          pretty_value do
            User.find(bindings[:object].user_id).name
          end
        end
      end
    end
  end
end
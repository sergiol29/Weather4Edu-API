module StationAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 2
      list do
        field :id
        field :user_id do
          pretty_value do
            User.find(bindings[:object].user_id).name
          end
        end
        field :name
        field :code
        field :latitude
        field :longitude
      end
      edit do
        field :user_id, :enum do
          enum do
            User.all.collect {|p| [p.name, p.id]}
          end
        end
        field :name
        field :code
        field :latitude
        field :longitude
      end
      show do
        field :id
        field :user_id do
          pretty_value do
            User.find(bindings[:object].user_id).name
          end
        end
        field :name
        field :code
        field :latitude
        field :longitude
      end
    end
  end
end
module StationAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 2
      list do
        field :id
        field :user_id # :user_id = method in models/station
        field :name
        field :code
        field :latitude
        field :longitude
      end
      edit do
        field :user_id
        field :name
        field :code
        field :latitude
        field :longitude
      end
      show do
        field :id
        field :user_id
        field :name
        field :code
        field :latitude
        field :longitude
      end
    end
  end
end
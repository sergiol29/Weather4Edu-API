module  ValueMaxAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 5
      list do
        field :station_id
        field :value
        field :timestamp
        field :variable_id
      end
      show do
        field :station_id
        field :value
        field :timestamp
        field :variable_id
      end
    end
  end
end
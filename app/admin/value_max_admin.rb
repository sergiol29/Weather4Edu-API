module  ValueMaxAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 6
      list do
        field :station_id do
          pretty_value do
            Station.find(bindings[:object].station_id).code
          end
        end
        field :value
        field :timestamp
        field :variable_id do
          pretty_value do
            Variable.find(bindings[:object].variable_id).name
          end
        end
      end
      show do
        field :station_id do
          pretty_value do
            Station.find(bindings[:object].station_id).code
          end
        end
        field :value
        field :timestamp
        field :variable_id do
          pretty_value do
            Variable.find(bindings[:object].variable_id).name
          end
        end
      end
    end
  end
end
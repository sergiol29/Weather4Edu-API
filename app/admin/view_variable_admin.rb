module  ViewVariableAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 9
      list do
        field :name
        field :symbol
        field :station_id do
          pretty_value do
            Station.find(bindings[:object].station_id).code
          end
        end
        field :variable_id do
          pretty_value do
            Variable.find(bindings[:object].variable_id).code
          end
        end
      end
      edit do
        field :name
        field :symbol
        field :station_id, :enum do
          enum do
            Station.all.collect {|p| [p.code, p.id]}
          end
        end
        field :variable_id, :enum do
          enum do
            Variable.all.collect {|p| [p.code, p.id]}
          end
        end
        field :color
        field :view_human
      end
      show do
        field :name
        field :symbol
        field :station_id do
          pretty_value do
            Station.find(bindings[:object].station_id).code
          end
        end
        field :variable_id do
          pretty_value do
            Variable.find(bindings[:object].variable_id).code
          end
        end
        field :color
        field :view_human
      end
    end
  end
end
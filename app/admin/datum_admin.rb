module  DatumAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view datum
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 4
      list do
        field :frame_id
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
        field :value
        field :timestamp
      end
      show do
        field :frame_id
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
        field :value
        field :timestamp
      end
    end
  end
end
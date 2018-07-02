class ViewVariable < ApplicationRecord
  belongs_to :Station, optional: true, dependent: :destroy
  belongs_to :Variable, optional: true, dependent: :destroy

  VALID_COLOR_REGEX = /#(?:[0-9a-fA-F]{3}){1,2}/i
  validates :variable_id, presence: true
  validates :station_id, presence: true
  validates :color, format: { with: VALID_COLOR_REGEX }, allow_blank: true

  # Include file app/admin/station_admin.rb, this file configure model Station in RailsAdmin
  include ViewVariableAdmin
end

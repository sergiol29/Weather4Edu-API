class LastFrame < ApplicationRecord
  belongs_to :Variable, optional: true
  belongs_to :Station, optional: true

  validates :variable_id, presence: true
  validates :station_id, presence: true

  # Include file app/admin/last_frame_admin.rb, this file configure model LastFrame in RailsAdmin
  include LastFrameAdmin
end

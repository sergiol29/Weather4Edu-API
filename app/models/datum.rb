class Datum < ApplicationRecord
  belongs_to :Variable, optional: true
  belongs_to :Station, optional: true
  belongs_to :Frame, optional: true

  validates :station_id, presence: true
  validates :variable_id, presence: true
  validates :frame_id, presence: true

  # Include file app/admin/datum_admin.rb, this file configure model Datum in RailsAdmin
  include DatumAdmin
end

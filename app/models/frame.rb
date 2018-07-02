class Frame < ApplicationRecord
  belongs_to :Station, optional: true, dependent: :destroy
  has_many :Datum

  validates :station_id, presence: true
  validates :raw, presence: true
  validates :timestamp, presence: true

  # Include file app/admin/frame_admin.rb, this file configure model Frame in RailsAdmin
  include FrameAdmin
end

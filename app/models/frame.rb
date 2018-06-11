class Frame < ApplicationRecord
  belongs_to :Station, optional: true
  has_many :Datum

  validates :raw, presence: true
  validates :timestamp, presence: true

  # Include file app/admin/frame_admin.rb, this file configure model Frame in RailsAdmin
  include FrameAdmin
end

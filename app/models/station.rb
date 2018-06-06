class Station < ActiveRecord::Base
  belongs_to :User, optional: true
  has_many :Frame
  has_many :ValueMax
  has_many :ValueMin
  has_many :LastFrame

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  # Include file app/admin/station_admin.rb, this file configure model Station in RailsAdmin
  include StationAdmin
end

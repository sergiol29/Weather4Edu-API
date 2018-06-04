class Station < ActiveRecord::Base
  belongs_to :User
  has_many :Frame
  has_many :ValueMax
  has_many :ValueMin
  has_many :LastFrame

  validates :user_id, presence: true
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  # Include file app/admin/user_admin.rb, this file configure model Frame in RailsAdmin
  include StationAdmin
end

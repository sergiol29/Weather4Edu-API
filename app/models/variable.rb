class Variable < ApplicationRecord
  has_many :ValueMax
  has_many :ValueMin
  has_many :LastFrame
  has_many :Datum
  belongs_to :User, optional: true

  VALID_COLOR_REGEX = /#(?:[0-9a-fA-F]{3}){1,2}/i
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :color, format: { with: VALID_COLOR_REGEX }, allow_blank: true

  # Include file app/admin/variable_admin.rb, this file configure model Variable in RailsAdmin
  include VariableAdmin
end

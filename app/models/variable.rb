class Variable < ApplicationRecord
  has_many :ValueMax
  has_many :ValueMin
  has_many :LastFrame

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :symbol, presence: true

  # Include file app/admin/variable_admin.rb, this file configure model Variable in RailsAdmin
  include VariableAdmin
end

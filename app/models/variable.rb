class Variable < ApplicationRecord
  has_many :ValueMax
  has_many :ValueMin
  has_many :LastFrame

  validates :code, presence: true, uniqueness: true
end

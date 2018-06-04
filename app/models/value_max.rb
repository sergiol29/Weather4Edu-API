class ValueMax < ApplicationRecord
  belongs_to :Variable
  belongs_to :Station

  validates :id, presence: true, uniqueness: true
end

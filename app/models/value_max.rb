class ValueMax < ApplicationRecord
  has_and_belongs_to_many :variables
  belongs_to :stations
end

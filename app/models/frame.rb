class Frame < ApplicationRecord
  belongs_to :Station
  validates :raw, presence: true

end

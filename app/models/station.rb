class Station < ActiveRecord::Base
  has_many :frames

  validates :code, presence: true, uniqueness: true

end

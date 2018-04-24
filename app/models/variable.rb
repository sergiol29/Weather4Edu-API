class Variable < ApplicationRecord
  has_and_belongs_to_many :value_maxes
  has_and_belongs_to_many :value_mins
  has_and_belongs_to_many :last_frames
end

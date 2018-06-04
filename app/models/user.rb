class User < ApplicationRecord
  has_many :Station

  attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
  validates :password, confirmation: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create
end

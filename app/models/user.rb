class User < ApplicationRecord
  has_many :Station

  attr_accessor :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create

  # Include file app/admin/user_admin.rb, this file configure model Frame in RailsAdmin
  include UserAdmin
end

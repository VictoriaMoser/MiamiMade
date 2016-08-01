class User < ApplicationRecord
  has_secure_password

  has_many :startups
  has_many :investors

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end

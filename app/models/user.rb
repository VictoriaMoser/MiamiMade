class User < ApplicationRecord
  has_secure_password

  has_many :startups
  has_many :investors
end

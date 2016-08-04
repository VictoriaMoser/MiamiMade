class User < ApplicationRecord
  before_create :confirmation_token
  
  has_secure_password

  has_many :startups
  has_many :investors

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

private
  def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end

class User < ApplicationRecord
  before_create :confirmation_token

  has_secure_password

  has_many :startups
  has_many :investors

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def email_activate
    self.email_confirmation = true
    self.token_confirmation = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
    if self.token_confirmation.blank?
      self.token_confirmation = SecureRandom.urlsafe_base64.to_s
    end
  end

end

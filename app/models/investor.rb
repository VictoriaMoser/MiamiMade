class Investor < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :founded_date, presence: true
  
  def approve
    self.approval = true
  end
end

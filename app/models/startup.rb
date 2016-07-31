class Startup < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :founded_date, presence: true

  def aprove
    self.approval = true
  end
end

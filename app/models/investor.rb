class Investor < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true, uniqueness:true
  validates :address, presence: true
  validates :description, presence: true
  validates :founded_date, presence: true

  def approve
    self.approval = true
  end

  def self.grab_location
    Investor.all.map do |investor|
      [investor.latitude, investor.longitude]
    end
  end


  enum vertical: ["Advertising", "Apps", "Biotechnology", "Commerce and Shopping", "Community and Lifestyle", "Consumer Electronics", "Content and Publishing","Data and Analytics","Fashion","Financial Services","Food and Beverage","Government and Military","Hardware","Healthcare","Internet Services","Manufacturing","Media and Entertainment","Mobile","Software"]

end

class Startup < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  # validates :description, presence: true
  # validates :founded_date, presence: true
  # validates :description, length:{ maximum:100 }
  def approve
    self.approval = true
  end

  def self.grab_location
    Startup.all.map do |startup|
      [startup.latitude, investor.longitude]
    end
  end




  enum vertical: ["Advertising", "Apps", "Biotechnology", "Commerce and Shopping", "Community and Lifestyle", "Consumer Electronics", "Content and Publishing","Data and Analytics","Education","Fashion","Financial Services","Food and Beverage","Government and Military","Hardware","Healthcare","Internet Services","Manufacturing","Media and Entertainment","Mobile","Pharmaceuticals","Software"]
end

# Advertising 0
# Apps 1
# Biotechnology 2
# Commerce and Shopping 3
# Community and Lifestyle 4
# Consumer Electronics 5
# Content and Publishing 6
# Data and Analytics 7
# Education 8
# Fashion 9
# Financial Services 10
# Food and Beverage 11
# Government and Military 12
# Hardware 13
# Healthcare 14
# Internet Services 15
# Manufacturing 16
# Media and Entertainment 17
# Mobile 18
# Pharmaceuticals 19
# Software 20

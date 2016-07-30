class Investor < ApplicationRecord
  belongs_to :user, optional: true
  
  def aprove
    self.approval = true
  end
end

class Investor < ApplicationRecord
  belongs_to :user, optional: true
end

class Startup < ApplicationRecord
  belongs_to :user, optional: true
end

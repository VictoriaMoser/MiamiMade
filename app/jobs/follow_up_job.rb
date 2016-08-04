class FollowUpJob < ApplicationJob
  queue_as :email

  def perform(*args)
    # Do something later
  end
end

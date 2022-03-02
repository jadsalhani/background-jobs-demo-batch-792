class UserUpdateJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user = User.find(user_id)
    puts "Calling Clearbit API for #{@user.email}..."
    # TODO: perform a time consuming task like Clearbit's Enrichment API.
    sleep 10
    puts "Done! Enriched #{@user.email} with Clearbit"
  end
end

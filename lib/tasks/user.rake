namespace :user do
  desc "TODO"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      UserUpdateJob.perform_later(user.id)
    end
  end

  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UserUpdateJob.perform_later(args[:user_id])
    # rake task will return when job is _done_
  end

end

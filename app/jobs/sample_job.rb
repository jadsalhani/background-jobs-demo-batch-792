class SampleJob < ApplicationJob
  queue_as :default

  def perform
    puts "Hello i an starting task"
    sleep 3
    puts "Hello I finish task"
  end
end

# desc "Explaining what the task does"
# task :power_reviews do
#   # Task goes here
# end
namespace :power_reviews do
  
  desc "Generates the product data feed in csv format"
  task :feed => :environment do
    puts "Generating Power Reviews product feed"
    PowerReviews::Feed.process
    puts "Completed"
  end
  
  desc "Copy the zip file from the ftp and unpack it"
  task :sync => :environment do
    puts "Fetching power review data"
    PowerReviews::Sync.execute
    puts "Completed"
  end
  
end

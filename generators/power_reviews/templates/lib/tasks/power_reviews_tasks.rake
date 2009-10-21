namespace :power_reviews do
  
  desc "Outputs the PowerReviews feed in CSV format"
  task :feed => :environment do
    puts PowerReviews::Feed.process
  end
  
  desc "Copy the zip file from the ftp and unpack it then deliver the product feed"
  task :sync => :environment do
    puts "Syncing PowerReviews data"
    PowerReviews::Sync.execute
    puts "Completed"
  end
  
end

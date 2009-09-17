class PowerReviewsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory "lib/tasks"
      m.file 'lib/tasks/power_reviews_tasks.rake', 'lib/tasks/power_reviews_tasks.rake'
      
      m.directory "config/initializers"

      m.file 'config/power_reviews.yml', 'config/power_reviews.yml'
      m.file 'config/initializers/power_reviews.rb', 'config/initializers/power_reviews.rb'
      m.file 'config/schedule.rb', 'config/schedule.rb'
    end
  end
end

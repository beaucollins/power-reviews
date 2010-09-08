require 'power_reviews/protocols/base'
require 'power_reviews/protocols/cp'
require 'power_reviews/protocols/ftp'
require 'power_reviews/feed'

module PowerReviews  
  # Downloads the ftp file and stores it in the correct location unzipped
  class Sync
    require 'yaml'
    require 'fileutils'
    
    PROTOCOLS = {
      :cp => Protocols::Cp,
      :ftp => Protocols::Ftp
    }
    
    class << self
    
      # Execute the necessary actions
      def execute
        self.start do |client, config|
        
          zip_path = "#{Rails.root}/public/system/reviews.zip"
        
          unless client.done?
            FileUtils.mkdir_p(File.dirname(zip_path))
            # we need the correct path to be setup
            client.copy_zip(zip_path)
            `cd #{File.dirname(zip_path)} && unzip -o #{zip_path}`
            client.done!
          end
        
          # zip up the powerreviews data tell the client to store it
          data_path = "#{RAILS_ROOT}/tmp/review_data.csv"
          File.open(data_path, 'w') do |f|
            f.puts PowerReviews::Feed.process
          end
          client.copy_data_feed(data_path)
        
        end
      end

      # Given the environment loads up the yaml file and creates a new instance
      def start
        config = self.configure
        syncer = PROTOCOLS[config.delete('protocol').intern].new(config)
        yield syncer, config
        syncer.cleanup
      end
      
      def configure
        @config ||= YAML::load(File.open("#{RAILS_ROOT}/config/power_reviews.yml"))[Rails.environment] || {}
      end
    
    end
        
  end
  
end
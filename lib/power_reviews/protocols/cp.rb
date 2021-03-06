module PowerReviews
  module Protocols
    class Cp < Base
      
      require 'fileutils'
      
      def done?
        !File.exists?(@config['done'])
      end
      
      def done!
        File.delete(@config['done'])
      end
      
      def copy_zip(to)
        FileUtils.cp(@config['zip'], to)
      end
      
      def copy_data_feed(from)
        # do nothing, leave the zip where it is
      end
      
    end
  end
end
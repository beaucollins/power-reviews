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
      
    end
  end
end
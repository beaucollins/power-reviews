module PowerReviews
  module Protocols
    
    # This should provide the necessary actions for moving the zip
    # and
    class Base
      
      def initialize(config={})
        @config = config || {}
      end
      
      # Returns true if the done file is missing
      def done?
        true
      end
      
      # Delete the done file
      def done!
        
      end
      
      # Do the copying of the zip file to the preferred destination
      def copy_zip(to)
        puts 'This is the base class'
      end
      
      
      # do any cleanup necessary
      def cleanup
        
      end
      
    end
    
  end
end
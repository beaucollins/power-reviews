
require "net/ftp"

module PowerReviews
  module Protocols
    class Ftp < Base
      
      # Returns true if the done file is missing
      def done?
        !client.nlst.include?(@config['done'])
      end
      
      # Delete the done file
      def done!
        client.delete(@config['done'])
      end
      
      # Do the copying of the zip file to the preferred destination
      def copy_zip(to)
        client.getbinaryfile(@config['zip'], to)
      end
      
      # do any cleanup necessary
      def cleanup
        @client.close
      end
      
      def client
        return @client unless @client.nil?
        @client = Net::FTP.new(@config['host'])
        @client.login(@config['username'], @config['password'])
        @client
      end
      
    end
  end
end
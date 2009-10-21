require "faster_csv"

module PowerReviews
  
  # Collects the feed data then outputs to CSV file for delivery to the power review peeps
  # Requires a proc that will find the data and populate
  class Feed
    
    @@processor = nil
    attr_reader :items
    
    def initialize
      @items = Array.new
    end
    
    # add an item to the feed
    def << item
      raise ArgumentError unless item.is_a?(FeedItem)
      @items << item
    end
    
    def self.processor=blk
      @@processor = blk
    end
    
    def self.process
      feed = self.new
      @@processor[feed] unless @@processor.nil?
      feed.to_csv
    end
    
    def to_csv
      @csv ||= FasterCSV.generate do |csv|
        csv << FeedItem.field_names
        @items.each do |item|
          csv << item.values
        end
      end
    end
    
  end
  
end
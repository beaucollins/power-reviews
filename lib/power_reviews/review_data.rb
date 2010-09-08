require 'find'
require 'rexml/document'

module PowerReviews
  
  class ReviewData
    
    class << self
      
      # retrieve the summary data for the given page_id
      def summary(page_id)
        document.summary(page_id)
      end
      
      protected
      
        def document
          @document ||= new
        end
            
    end
    
    
    # initializes a new ReviewData document
    def initialize(search_path=nil)
      @search_path = search_path || PowerReviews::Config.review_data_path
    end
    
    def summary(page_id)
      node = nil
      summary_data.elements.each("//pageid") do |e|
        node = e.parent if e.get_text == page_id
      end
      !node.nil? ? Summary.new(node) : nil
    end
    
    def summary_data
      @summary_data ||= read_document('review_data_summary')
    end
    
    def product_data
      @product_data ||= read_document('review_data_complete')
    end
    
    protected
    
      def read_document(name)
        REXML::Document.new(File.new(xml_documents[name]))
      end
    
      def xml_documents
        return @files unless @files.nil?
        files = {}

        Find.find(@search_path) do |path|
          bn = File.basename(path, '.xml')
          files[bn] = path if ['review_data_complete', 'review_data_summary'].include?(bn)
        end
        @files = files
        @files
      end
      
    class Summary
      
      attr_reader :full_name, :average_rating, :reviews
      
      def initialize(element)
        @element = element
        @full_name = text_for_element('name')
        @average_rating = text_for_element('average_rating_decimal').to_s.to_f
        @reviews = text_for_element('fullreviews').to_s.to_i
      end
      
      protected
      
        def text_for_element(name)
          element = nil
          @element.each_element(name) { |e| element = e if element.nil? }
          element.nil? ? '' : element.get_text
        end
      
      
    end
      
    
  end
  
  
end
module PowerReviews
  class Config
    
    class << self
      def merchant_group_id
        @merchant_group_id
      end

      def merchant_group_id=id
        @merchant_group_id = id
      end

      def site_id
        @site_id
      end
    
      def site_id=id
        @site_id = id
      end
      
      def review_data_path
        @review_data_path || 'public/system/pwr'
      end
      
      def review_data_path=path
        @review_data_path = path
      end
      
    end
    
  end
end
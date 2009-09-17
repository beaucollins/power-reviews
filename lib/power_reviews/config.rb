module PowerReviews
  class Config
    
    def self.merchant_group_id
      @@merchant_group_id
    end

    def self.merchant_group_id=id
      @@merchant_group_id = id
    end

    def self.site_id
      @@site_id
    end
    
    def self.site_id=id
      @@site_id = id
    end
    
  end
end
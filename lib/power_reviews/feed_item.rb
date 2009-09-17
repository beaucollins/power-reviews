module PowerReviews
  
  class FeedItem
    
    CATEGORY_SEPARATOR = " > "
    
    REQUIRED_FIELDS = [:product_url, :name, :description, :price, :image_url, :category, :page_id]
    OPTIONAL_FIELDS = [:manufacturer_id, :shipping, :brand, :upc, :specifications, :in_stock,
                      :affiliate_id, :affiliate_url, :add_to_cart_url, :page_id_variant]
                      
    FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS
    
    FIELDS.each {|field| attr_accessor field }
    
    def initialize(attributes = {})
      attributes ||= {}
      attributes.each do |field, value|
        self.send("#{field.to_s}=".intern, value)
      end
    end
    
    def category=cat
      @category = cat.is_a?(Array) ? cat.join(CATEGORY_SEPARATOR) : cat.to_s
    end
    
    def values
      FIELDS.collect {|f| self.send(f) }
    end
    
    def self.field_names
      FIELDS.collect { |f| f.to_s }
    end
    
  end
  
end
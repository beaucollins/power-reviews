module PowerReviews
  module ViewHelpers
      
    def power_reviews_javascript_tag(path_to_file = '/system/pwr/engine/js/full')
      unless @power_reviews_javascript_needed.nil?
        javascript_include_tag(path_to_file)
      end
    end

    def power_reviews_javascript_variables(options = {})
      options = {
        :locale => 'en_US',
        :zip_location => '/system/',
        :pr_style_sheet => ''
      }.merge(options)
      javascript_tag do
        options.collect { |key, val| "var pr_#{key} =  '#{val}';" unless val.blank? }.compact!.join("\n")
      end
    end

    def power_reviews_snippet(page_id, write_review_url, review_anchor = '#ReviewHeader')
      @power_reviews_javascript_needed = true
      javascript_tag do
        <<-eos
        if(POWERREVIEWS){
          POWERREVIEWS.display.snippet(document, {
            pr_page_id : '#{page_id}',
            pr_write_review : '#{write_review_url}',
            pr_read_review : '#{review_anchor}'
          });
        }
        eos
      end
    end

    def power_reviews_display(page_id, write_review_url)
      @power_reviews_javascript_needed = true
      javascript_tag do
        <<-eos
        if(POWERREVIEWS){
          POWERREVIEWS.display.engine(document, {
            pr_page_id : '#{page_id}',
            pr_write_review : '#{write_review_url}'
          });
        }
        eos
      end
    end
  
    def power_reviews_form(page_id, options = {})
      @power_reviews_javascript_needed = true
      options = {
        :locale => '',
        :site_id => PowerReviews::Config.site_id,
        :merchant_group_id => PowerReviews::Config.merchant_group_id,
        :source => 'web',
        :merchant_user_id => '',
        :merchant_user_email => '',
        :promo_code => '',
        :style_sheet => ''
      }.merge(options)
    
      javascript_tag do
        options.collect { |key, val| "var pr_#{key} = '#{val}';" unless val.blank? }.unshift("var pr_page_id = '#{page_id}';").compact!.join("\n")
      end << javascript_include_tag('/system/pwr/engine/js/appLaunch')
    
    end
  
  end
  
end
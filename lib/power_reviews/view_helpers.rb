module PowerReviews
  module ViewHelpers
    
    # generates hReview compatible HTML for the given page_id
    # renders the content as HTML at render time instead of relying
    # on the Power Reviews javascript library to render the review content
    def power_reviews_hreview(page_id, &blk)
      
      summary = PowerReviews::ReviewData.summary(page_id)
      
      if block_given?
        yield summary unless summary.nil?
      else summary.nil?
      
        <<-review
        <div class='hreview-aggregate'>
          <span class="item">
            <span class="fn">#{summary.full_name}</span>
          </span>
          <span class="rating">
            <span class="average">#{summary.average_rating}</span>
          </span>
          based on
          <span class="count">#{summary.reviews}</span> user reviews.
        </div>
        review
      
      end
    end
    
    # Includes the power reviews javascript, optionally provide the path to
    # the javascript file if not installed in the default location
    def power_reviews_javascript_tag(path_to_file = '/system/pwr/engine/js/full')
      unless @power_reviews_javascript_needed.nil?
        javascript_include_tag(path_to_file)
      end
    end

    # Generates the javascript variables for a page that will be rendering
    # PowerReviews elements
    # 
    # Options:
    # 
    # +:locale+ - default: en_US
    # +:zip_location+ - where Power Reviews data is stored default: /system/
    # +:pr_style_sheet - Location of custom Power Reviews stylesheet default: "" (empty string)
    # 
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
    
    # Generates JavaScript to display the Power Reviews "snippet" element. Will show a summary
    # of the reviews for the given +page_id+.
    # 
    # Arguments:
    # +page_id+ - the identifier for the product
    # +write_review_url+ - the url to link to a page where the user can author a review
    # +review_ancor+ - the url or anchor that links to the full reviews. Default: "#ReviewHeader"
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
    
    # Displays the full reviews for the given +page_id+
    # 
    # Arguments:
    # +page_id+ - The identifier for the item to show reviews for
    # +write_review_url+ - A url for a page where the user can write a review for the given product
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
  
    # Generates the javascript that renders the PowerReviews authoring form.
    # 
    # Arguments:
    # +page_id+ - The id of the item being reviewd
    # 
    # Options:
    # +:locale+ default ""
    # +:site_id+ default: PowerReviews::Config.site_id
    # +:merchant_group_id+ default: PowerReviews::Config.merchant_group_id
    # +:source+ default: 'web'
    # +:merchant_user_id+ default: ''
    # +:merchant_user_email+ default: ''
    # +:promo_code+ default: ''
    # +:style_sheet+ default: ''
    
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
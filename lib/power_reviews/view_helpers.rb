class PowerReviewsHelper  
  def power_reviews_javascript_tag
    javascript_include_tag('/system/pwr/engine/js/full')
  end

  def power_reviews_javascript_variables
    javascript_tag do
      <<-eos
        var pr_locale= "en_US";
        var pr_zip_location= "/system/";
        //var pr_style_sheet= "http://www.yoursite.com/css/pr_override.css";
      eos
    end
  end

  def power_reviews_snippet(page_id, review_anchor = '#ReviewHeader')
    javascript_tag do
      <<-eos
      POWERREVIEWS.display.snippet(document, {
        pr_page_id : '#{page_id}',
        pr_write_review : '#',
        pr_read_review : '#{review_anchor}'
      });
      eos
    end
  end

  def power_reviews_display(page_id)
    javascript_tag do
      <<-eos
      POWERREVIEWS.display.engine(document, {
        pr_page_id : '#{page_id}',
        pr_write_review : '#'
      });
      eos
    end
  end
end
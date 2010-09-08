require 'test_helper'

class ReviewDataTest < ActiveSupport::TestCase
  
  should "load up review data" do
    
    @review_data = PowerReviews::ReviewData.new(File.expand_path(__FILE__ + "/../../fixtures/rawdata"))
    assert @review_data.summary_data.kind_of?(REXML::Document)
    
  end
  
  should "get summary data for page id" do
    
    @summary = PowerReviews::ReviewData.summary('shadow') 
    assert_equal @summary.full_name, 'Shadow'
    assert_equal @summary.average_rating, 5.0
    assert_equal @summary.reviews, 1
    
  end
  
end
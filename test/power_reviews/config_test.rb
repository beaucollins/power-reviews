require 'test_helper'

class ConfigTest < ActiveSupport::TestCase
  
  should "have merchant_group_id" do
    PowerReviews::Config.merchant_group_id = 5
    assert_equal PowerReviews::Config.merchant_group_id, 5
  end
  
  should "have site_id" do
    PowerReviews::Config.site_id = 5
    assert_equal PowerReviews::Config.site_id, 5
  end
  
  should "have review data path" do
    assert_equal PowerReviews::Config.review_data_path, 'public/system/pwr'
    PowerReviews::Config.review_data_path="test"
    assert_equal 'test', PowerReviews::Config.review_data_path
  end
  
end
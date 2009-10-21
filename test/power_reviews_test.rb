require 'test_helper'
require 'power_reviews'

class PowerReviewsTest < ActiveSupport::TestCase
  should "have itemdata with correct attributes" do
    item = PowerReviews::FeedItem.new
    assert PowerReviews::FeedItem::FIELDS.is_a?(Array)
    PowerReviews::FeedItem::FIELDS.each {|f| assert item.respond_to?(f), "Item did not have attribute #{f}" }
  end
end

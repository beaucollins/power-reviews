require 'test_helper'
require 'power_reviews/view_helpers'

class FakeController
  include PowerReviews::ViewHelpers
end


class ViewHelpersText < ActiveSupport::TestCase
  
  def controller
    @controller ||= FakeController.new
  end
  
  setup do
    PowerReviews::Config.review_data_path='test/fixtures/rawdata'
    PowerReviews::ReviewData.reload!
  end
  
  should "have hReview helper" do
    
    assert controller.power_reviews_hreview('shadow') =~ %r{<span class="fn">Shadow</span>}
    
  end
  
end
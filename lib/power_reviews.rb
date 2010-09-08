require 'power_reviews/config'
require 'power_reviews/review_data'

require 'power_reviews/feed_item'
require 'power_reviews/feed'

require 'power_reviews/sync'
require 'power_reviews/view_helpers'

ActionView::Base.send :include, PowerReviews::ViewHelpers if defined? ActionView::Base
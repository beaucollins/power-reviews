# Unique for each merchant. Your merchant_group_id is located in the PowerReviews Dashboard > Merchant
# Group Properties section.

# PowerReviews::Config.merchant_group_id = 0

# ID representing your website (default value is "1"). If you have multiple websites and would like to
# integrate PowerReviews onto each site, we can set your account as a Master Merchant. This enables
# review sharing and consolidated management among your different websites. When using the “Master
# Merchant” configuration, you assign a different Site ID to each site that will have reviews. This ID
# can be your own internal ID for the site or an ID assigned by PowerReviews. If you are implementing
# a single merchant, please leave the default Site ID set to "1". The Site ID is configurable in the
# Dashboard in the Merchant Properties section.

# PowerReviews::Config.site_id = 1

# Supply the Power Reviews feed processor with items to produce. Feed is an
# instance of PowerReviews::Feed.
# 
# 
# PowerReviews::Feed.processor = lambda { |feed| }

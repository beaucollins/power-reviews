module PowerReviews #:nodoc:
  module Routes
    def power_reviews
      @set.add_route("/reviews", {:controller => "power_reviews_controller", :action => "index"})
    end
  end
end

ActionController::Routing::RouteSet::Mapper.send :include, PowerReviews::Routes

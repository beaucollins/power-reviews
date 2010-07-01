# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{power_reviews}
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Beau Collins"]
  s.date = %q{2010-07-01}
  s.description = %q{Tools and library for integrating Power Reviews into a rails website.}
  s.email = %q{beaucollins@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "generators/power_reviews/USAGE",
     "generators/power_reviews/power_reviews_generator.rb",
     "generators/power_reviews/templates/config/initializers/power_reviews.rb",
     "generators/power_reviews/templates/config/power_reviews.yml",
     "generators/power_reviews/templates/config/schedule.rb",
     "generators/power_reviews/templates/lib/tasks/power_reviews_tasks.rake",
     "lib/power_reviews.rb",
     "lib/power_reviews/config.rb",
     "lib/power_reviews/feed.rb",
     "lib/power_reviews/feed_item.rb",
     "lib/power_reviews/protocols/base.rb",
     "lib/power_reviews/protocols/cp.rb",
     "lib/power_reviews/protocols/ftp.rb",
     "lib/power_reviews/routes.rb",
     "lib/power_reviews/sync.rb",
     "lib/power_reviews/view_helpers.rb",
     "power_reviews.gemspec",
     "rails/init.rb",
     "test/power_reviews_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/beaucollins/power_reviews}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Helps integrate Power Reviews into a rails site}
  s.test_files = [
    "test/power_reviews_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<javan-whenever>, [">= 0"])
      s.add_runtime_dependency(%q<fastercsv>, [">= 0"])
    else
      s.add_dependency(%q<javan-whenever>, [">= 0"])
      s.add_dependency(%q<fastercsv>, [">= 0"])
    end
  else
    s.add_dependency(%q<javan-whenever>, [">= 0"])
    s.add_dependency(%q<fastercsv>, [">= 0"])
  end
end

every 1.day, :at => '4:30 am' do
  rake 'power_reviews:sync'
end
Devise::Twitter.setup do |config|
  # Generate them at http::/twitter.com/apps
  config.consumer_key = "my consumer key"
  config.consumer_secret = "my consumer secret"
  config.scope = :user
end


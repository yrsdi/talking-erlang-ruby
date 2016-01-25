require 'rubygems'
require 'erlectricity'
require 'stringio'
require 'twitter'


id = Twitter::REST::Client.new do |config|
  config.consumer_key = "YOUR_CONSUMER_KEY"
  config.consumer_secret = "YOUR_CONSUMER_SECRET"
  config.access_token = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

receive do |f|
  f.when([:post, String]) do |msg|
    # connect to twitter & post Hello World
    id.update("@yrsdi #{msg}" )
    f.send!([:result, "Tweet sent! Status : #{msg}"])
    f.receive_loop
  end
end

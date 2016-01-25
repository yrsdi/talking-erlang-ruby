require 'rubygems'
require 'erlectricity'
require 'stringio'
require 'twitter'


id = Twitter::REST::Client.new do |config|
  config.consumer_key = "rT0U8foeDwHSm1LdjFPOY88rf"
  config.consumer_secret = "oDl6JUhVAWwaQ950M98gFwQ6jG3PIOktBPGBTHcRCnvcIGUeEf"
  config.access_token = "34250827-7aoPlHhmYfuWSSAZJeDaDj7DAQMftI9GqfFweBkZ3"
  config.access_token_secret = "mct5jRoUcc2VJBQkA3Ed3X4Hpr50JS7DJLr1TAh2LLdPd"
end

receive do |f|
  f.when([:post, String]) do |msg|

    # connect to twitter & post Hello World
    #id = Twitter::Base.new('yrsdi', 'f473nC0rp').post(msg).id
    id.update("@yrsdi #{msg}" )
    f.send!([:result, "Tweet sent! Status id: #{msg}"])

    f.receive_loop
  end
end
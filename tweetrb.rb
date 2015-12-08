require 'rubygems'
require 'oauth'
require 'green_shoes'
require 'json'

#Send tweet function, based on https://www.codecademy.com/
def sendtweet(tweet)

    consumer_key = OAuth::Consumer.new(
      "",
      "")
    access_token = OAuth::Token.new(
      "",
      "")

    baseurl = "https://api.twitter.com"
    path    = "/1.1/statuses/update.json"
    address = URI("#{baseurl}#{path}")
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data(
      "status" => tweet,
    )

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # Issue the request.
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request

    tweet = nil
    if response.code == '200' then
      puts "Tweet send correctly"
    else
      puts "Tweet error"
    end


end

#########################################################################

Shoes.app :title => "tweetrb",
          :width => 320,
          :height => 240 do

    para "Enter tweet"
    @tweet = edit_line
    button "send tweet" do
        tweet = @tweet.text
        sendtweet(tweet)
    end
end


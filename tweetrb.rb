require 'rubygems'
require 'oauth'
require 'json'

#Send tweet function, based on https://www.codecademy.com/
def sendtweet(tweet)

    consumer_key = OAuth::Consumer.new(
      "EjKbSR9RyLaCiCCovP0QbABB5",
      "K0jjXdnJL3wnlNxz2Ns5BCBCyM0ztuzPa1M6PnZkFFbX6CBz25")
    access_token = OAuth::Token.new(
      "595581442-tupyhJj8ZhRtEGnlcwpudzo3Ikf83G96XFH1kCEu",
      "kV3e6cRXrIwX6J9eZDXqWV03kZPqjfVQtDV0vQ0bkrckQ")

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


#Main
sendtweet("Este tweet va a ser borrado")


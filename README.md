# tweetrb
Small twitter GUI application based on ruby

##Use

You need to have a [twitter aplication](https://apps.twitter.com/) and replace this part of the code for your application data

~~~
consumer_key = OAuth::Consumer.new(
  "READ/WRITE CONSUMER KEY",
  "READ/WRITE CONSUMER SECRET")
access_token = OAuth::Token.new(
  "READ/WRITE ACCESS TOKEN",
  "READ/WRITE ACCESS SECRET")
~~~

##Methods

* sendtweet


##Requirements

* [oauht](https://github.com/oauth-xx/oauth-ruby) `sudo gem install oauth`

* [green_shoes](https://github.com/ashbb/green_shoes) `gem install green_shoes`
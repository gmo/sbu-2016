require 'sqlite3'
require 'tweetstream'

#initiate tweet stream connection
TweetStream.configure do |config|
  config.consumer_key       = 'FwagvzNoy7CfnkfZJkdBQ4RLL'
  config.consumer_secret    = 'LzySWk4kBsiZBKt6uzPgtF0kDL9tCAKTbZTIWATjmtPDMeIuC5'
  config.oauth_token        = '4135857079-SkvJUl8V6exuydQAxAsCWXvOmNNajsS6Q2WTMyt'
  config.oauth_token_secret = 'HJAohEy8NkJTnyBQ4lvewNunjArwHSd0VFF8H3PHkfHCs'
  config.auth_method        = :oauth
end

#connect to database
DB = SQLite3::Database.open "db/development.sqlite3"
tweets = Queue.new

#tweetstream thread for recieving tweets containing words from topics
tweetStreamThread = Thread.new {
  TweetStream::Client.new.track(DB.execute( "SELECT word from keywords" ).flatten.join(", ")) do |status|
  tweets.enq(status.text)
end}

#check topics occurences in each tweet
occurThread = Thread.new {
  while true do
    if !tweets.empty?
      tweet = tweets.deq
      topics.each_key {|k| topics[k] += 1 if tweet.downcase.include? k.to_s[2..-3]}
      puts topics
    end
  end
}





tweetStreamThread.join
occurThread.join
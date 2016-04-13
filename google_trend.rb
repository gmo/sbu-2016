#Database
require 'sqlite3'
require './GTrends'

#Connect to the Database
DB = SQLite3::Database.open "db/development.sqlite3"
gm = GTrendManager.new()
words = DB.execute( "SELECT word from keywords" ).flatten.join(" ").split()
printf "#{words}"

words.each do |word|
    count = gm.request(GRequest.new("#{word}"))
    if count != -1
        DB.execute( "UPDATE keywords SET gcount = #{count} WHERE word = '#{word}'")
    end
end
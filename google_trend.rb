#Database
require 'sqlite3'
require './GTrends'

#Connect to the Database
DB = SQLite3::Database.open "db/development.sqlite3"
gm = GTrendManager.new()
#collect all words in database
words = DB.execute( "SELECT word from keywords" ).flatten.join(" ").split()

#process ranks for each collected word
words.each do |word|
    #google request quota limit boolean
    quota_limit = false
    loop do
        #request rank for |word|
        count = gm.request(GRequest.new("#{word}"))
        #count == -1 if quota is reached, if not reached update count in database for |word|, set quota false in case loop came out of sleep
        if count != -1
            DB.execute( "UPDATE keywords SET gcount = #{count} WHERE word = '#{word}'")
            quota_limit = false
        #quota reached, sleep for 30min then request again
        else
            printf "Sleeping"
            sleep(1800)
            quota_limit = true
        end
    break if !quota_limit
end 
end
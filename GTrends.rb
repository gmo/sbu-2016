require 'net/http'
require 'uri'
require 'date'

class GRequest
    attr_reader :word, :date
    
    def initialize(word)
        @word = word
        @date = Date.today << 1
    end
end

class GTrendManager
    
    def request(trendrq)
        word = trendrq.word
        date = trendrq.date
        url = "http://www.google.com/trends/fetchComponent?hl=en&q=#{word}&date=#{date.mon}/#{date.year}+2m&cmpt=q&content=1&cid=TIMESERIES_GRAPH_0&export=5&w=500&h=330"
        page_content = open(url)
        if page_content.include? "Not enough search volume to show results"
            return 0
        end
        if page_content.include? "You have reached your quota limit. Please try again later"
            return -1
        end
        return parseContent(page_content);
    end
    
    private
    def open(url)
        Net::HTTP.get(URI.parse(url))
    end
    
    def parseContent(page_content)
        date = Date.today - 8
        sum = 0
        count = 0
        
        raw_data_array = page_content.split("rows\":")[1].split(",\"showHeadlines\"").first
        split_raw = raw_data_array.split("],")
        split_raw.each do |sr|
            source = sr.split("\"f\":\"")[1].split(",")
            if source[1] == " #{date.strftime("%B")} #{date.day}"
                sum = sum + source[5].to_i
                date = date + 1
                if source[5] != "null"
                    count += 1
                end
            end
        end
        return sum / count
    end
end
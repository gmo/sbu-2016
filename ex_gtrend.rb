#! ruby

require './GTrendManager.rb'
require 'pp'

gm = GTrendManager.new()
# search word is AMAZON, searched results are created from 2012/10 to 2012/11
gresult_1 = gm.request(GRequest.new("amazon", 2016, 3))

# display search result
gm.printResult(gresult_1)

# output search result as csv file
gm.outputAsCsv(gresult_1, "result_amazon.csv")

# search words are AMAZON and Kindle, searched results are created from 2012/10 to 2013/1
gresult_2 = gm.request(GRequest.new("AMAZON+Kindle", 2016, 3, 3))

# output search result as csv file
gm.outputAsCsv(gresult_2, "result_amazon_and_kindle.csv")

# convert search result to array(hash) and print it : Result is [ {"date"=>"2012-10-1", "number"=>"53"}, ... ]
pp gm.getResultAsArray(gresult_2)

class Keyword < ActiveRecord::Base
    before_save { |keywords| keywords.word.downcase! }
end

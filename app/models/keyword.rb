class Keyword < ActiveRecord::Base
    before_save { |keywords| keywords.word.downcase! }
    validates :word, :on => :create, :format => { with: /\A[a-z]+\Z/, :message => 'can only contain letters'}
    validates :word, :on => :create, :uniqueness => {:presence => true, :message => 'already exists'} 
end

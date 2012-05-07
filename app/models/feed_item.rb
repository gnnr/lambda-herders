class FeedItem < ActiveRecord::Base
  attr_accessible :category, :text 
  has_one :token
end

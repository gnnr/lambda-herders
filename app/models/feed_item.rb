class FeedItem < ActiveRecord::Base
  attr_accessible :category, :text 
  belongs_to :token
end

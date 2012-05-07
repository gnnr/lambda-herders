class FeedItem < ActiveRecord::Base
  attr_accessible :category, :text, :token
  belongs_to :token
end

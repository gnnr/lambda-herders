class FeedItem < ActiveRecord::Base
  attr_accessible :category, :text, :token, :message
  belongs_to :token
end

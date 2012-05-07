class Token < ActiveRecord::Base
  attr_accessible :token, :user_id
  belongs_to :user 
  has_many :feed_items
end

class Token < ActiveRecord::Base
  attr_accessible :token, :user_id
  belongs_to :user, :feed_items
end

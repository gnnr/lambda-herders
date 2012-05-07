class Token < ActiveRecord::Base
  attr_accessible :token, :user_id
end

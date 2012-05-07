class User < ActiveRecord::Base
  attr_accessible :email, :google_uid, :name, :google_token
  has_one :token
end

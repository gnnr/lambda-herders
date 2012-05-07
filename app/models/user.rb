class User < ActiveRecord::Base
  attr_accessible :email, :google_uid, :name, :token
  has_one :token
end

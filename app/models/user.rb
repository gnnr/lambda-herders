class User < ActiveRecord::Base
  attr_accessible :email, :google_uid, :name, :token
end

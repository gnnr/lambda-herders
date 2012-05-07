require 'yaml'
require 'digest/sha1'

class SessionController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.new(:name   => auth[:info]["name"],
                    :email  => auth[:info]["email"], 
                    :google_token  => auth[:info]["token"],
                    :google_uid => auth[:info]["google_uid"])
    user.save
    token = Token.new(:user_id => user.id, :token => Digest::SHA1.hexdigest(user.google_token))

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end

require 'yaml'
require 'digest/sha1'

class SessionController < ApplicationController
  def grant_token
    redirect_to '/auth/google_oauth2'
  end
  def create
    auth = request.env["omniauth.auth"]

    @user = User.where(:email => auth[:info]["email"]).first

    unless @user
      @user = User.new(:name   => auth[:info]["name"],
                      :email  => auth[:info]["email"], 
                      :google_token  => auth[:credentials]["token"],
                      :google_uid => auth[:info]["google_uid"])
      @user.save
      token = Token.create(:user_id => @user.id, :token => Digest::SHA1.hexdigest(@user.google_token))
    end

    session[:user_id] = @user.id
    render :text => "Your API Token #{@user.token.token}"
  end

  def destroy
    session[:user_id] = nil
    render :text => 'signed out' 
  end
end

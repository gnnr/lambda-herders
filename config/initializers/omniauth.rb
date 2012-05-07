OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, 'localhost', '3op5Q-KnavdmFlBp1EVY8p1o', :scope => 'https://mail.google.com/mail/feed/atom/' 
end

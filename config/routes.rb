ChaitinsConstant::Application.routes.draw do
  resources :feed_items
  
  match "/grant_token" => "session#grant_token"
  match "/auth/:provider/callback" => "session#create"
  match "/signout" => "session#destroy", :as => :signout
end

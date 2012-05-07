ChaitinsConstant::Application.routes.draw do
  resources :feed_items

  match "/auth/:provider/callback" => "session#create"
  match "/signout" => "session#destroy", :as => :signout
end

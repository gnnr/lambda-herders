ChaitinsConstant::Application.routes.draw do
  match "/auth/:provider/callback" => "session#create"
  match "/signout" => "session#destroy", :as => :signout
end

Rails::Application.routes.draw do
  match '/sessions/sign_in' => "multiauth/sessions#new", :as => :new_session
  match '/sessions/sign_out' => "multiauth/sessions#destroy", :method => :get, :as => :destroy_session

  match "/auth/:provider/callback" => "multiauth/sessions#auth"
end

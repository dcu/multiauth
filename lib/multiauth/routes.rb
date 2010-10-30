Rails::Application.routes.draw do
  mapping = Devise.mappings[:user]
  match "#{mapping.fullpath}/auth/:provider/callback" => "multiauth/sessions#auth", :as => :omniauth_callback
end

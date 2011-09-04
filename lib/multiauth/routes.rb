Rails.application.routes.draw do
  mapping = Devise.mappings[:user]
  if mapping
    match "#{mapping.fullpath}/auth/:provider/callback" => "multiauth/sessions#auth", :as => :omniauth_callback, :via => [:get, :post, :put]
  end
end


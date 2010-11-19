Rails.application.routes.draw do
  mapping = Devise.mappings[:user]
  if mapping
    match "#{mapping.fullpath}/auth/:provider/callback" => "multiauth/sessions#auth", :as => :omniauth_callback
  end
end


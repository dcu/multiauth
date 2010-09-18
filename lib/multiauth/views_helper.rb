module Multiauth
  module ViewsHelper
    def multiauth_box(url = nil)
      url = session_path(resource_name) if !url

      form_for(resource, :as => resource_name, :url => url, :html => {:id => "openid"}) do |f|
        %@<div id="nojsopenid">#{f.text_field(:identity_url, :id => "identity_url")}#{f.submit('Sign in')}</div>@+
        render(:partial => "multiauth/box")
      end
    end

    def multiauth_assets
      javascript_include_tag('multiauth')+
      stylesheet_link_tag('multiauth')
    end

    def multiauth_providers
      providers = Multiauth::PROVIDERS
      if !devise_mapping.oauthable?
        providers.delete("Facebook")
        providers.delete("Github")
      else
        providers.delete("Facebook") if !resource_class.oauth_providers.include?(:facebook)
        providers.delete("Github") if !resource_class.oauth_providers.include?(:github)
      end

      providers
    end
  end
end

::ActionView::Base.send :include, Multiauth::ViewsHelper

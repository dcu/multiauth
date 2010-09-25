module Multiauth
  module ViewsHelper
    def multiauth_box(resource_name, url = nil)
      url = session_path(resource_name) if !url

      form_for(resource_name, :url => url, :html => {:id => "openid"}) do |f|
        %@<div id="nojsopenid">#{f.text_field(:identity_url, :id => "identity_url")}#{f.submit('Sign in')}</div>@+
        render(:partial => "multiauth/box")
      end
    end

    def multiauth_assets
      javascript_include_tag('multiauth')+
      stylesheet_link_tag('multiauth')
    end

    def multiauth_providers
      mapping = request.env["devise.mapping"]
      providers = Multiauth::PROVIDERS
      if mapping && mapping.oauthable?
        providers.delete("Facebook") if !resource_class.oauth_providers.include?(:facebook)
        providers.delete("Github") if !resource_class.oauth_providers.include?(:github)
      else
        providers.delete("Facebook")
        providers.delete("Github")
      end

      if user_signed_in?
        providers["Twitter"][:url] = '/users/connect/twitter'
      end

      providers
    end
  end
end

::ActionView::Base.send :include, Multiauth::ViewsHelper

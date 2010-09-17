module Multiauth
  module ViewsHelper
    def multiauth_box(url = nil)
      url = session_path(resource_name) if !url

      form_for(resource, :as => resource_name, :url => url, :html => {:id => "openid"}) do
        "fuck you"
      end
    end

    def multiauth_assets
      javascript_include_tag('openid-realselector/js/jquery.openid.js')+
      javascript_include_tag('multiauth')+
      stylesheet_link_tag('/javascripts/openid-realselector/css/style')
    end
  end
end

::ActionView::Base.send :include, Multiauth::ViewsHelpers

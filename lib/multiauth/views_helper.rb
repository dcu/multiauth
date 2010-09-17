module Multiauth
  module ViewsHelper
    def multiauth_box(resource, resource_name, url = nil)
      url = session_path(resource_name) if !url

      form_for(resource, :as => resource_name, :url => url, :html => {:id => "openid"}) do
        "fuck you"
      end
    end
  end
end

::ActionView::Base.send :include, Multiauth::ViewsHelpers

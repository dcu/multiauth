module Multiauth
  module ViewsHelper
    def multiauth_box
      render(:partial => "multiauth/box")
    end

    def multiauth_assets
      javascript_include_tag('multiauth')+
      stylesheet_link_tag('multiauth')
    end

    def multiauth_providers
      Multiauth::PROVIDERS
    end
  end
end

::ActionView::Base.send :include, Multiauth::ViewsHelper

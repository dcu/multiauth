module Multiauth
  module ViewsHelper
    def multiauth_box(title = nil)
      render "multiauth/box", :title => title
    end

    def multiauth_menu(title = "Sign In")
      render "multiauth/menu", :title => title
    end

    def multiauth_assets
      javascript_include_tag('multiauth')+
      stylesheet_link_tag('multiauth')
    end

    def multiauth_providers
      Multiauth.providers || {}
    end

    def multiauth_link(provider, text = "", cssclass = nil)
      config = multiauth_providers[provider]
      css_class ||= "#{provider} openid_btn #{config["class"]}"

      %@<a class="#{css_class}" title="#{provider}" href="/auth/#{config["openid"] ? "open_id?openid_url=#{config["openid"]}" : "#{provider.downcase}"}">#{text}</a>@
    end
  end
end


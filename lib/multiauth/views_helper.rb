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
      cssclass ||= "#{provider} openid_btn #{config["class"]}"

      %@<a class="#{cssclass}" title="#{provider}" href="/users/auth/#{config["openid"] ? "open_id?openid_url=#{config["openid"]}" : "#{provider.underscore}"}">#{text}</a>@
    end
  end
end


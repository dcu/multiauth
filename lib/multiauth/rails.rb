ActionController::Base.append_view_path File.expand_path("../../../app/views", __FILE__)
::ActionView::Base.send :include, Multiauth::ViewsHelper

module Multiauth
  class Engine < ::Rails::Engine
    initializer "multiauth" do |app|
      config_file = Rails.root+"config/auth_providers.yml"
      providers = YAML::load(ERB.new(File.read(config_file)).result)
      if providers[Rails.env].nil?
        raise ArgumentError, "cannot find section for #{Rails.env} environment in #{config_file}"
      end

      Multiauth.providers = providers[Rails.env]

      require 'omniauth/openid'
      require 'openid/store/filesystem'

      app.config.middleware.use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp')

      app.config.middleware.use OmniAuth::Builder do
        Multiauth.providers.each do |provider, config|
          next if config["token"].blank?

          puts ">> Setting up #{provider} provider"
          provider provider.downcase.to_sym, config["id"], config["token"]
        end
      end
    end

    config.to_prepare do
      ApplicationController.send(:include, Multiauth::Helpers)
    end
  end
end

::ActionView::Base.send :include, Multiauth::ViewsHelper

module Multiauth
  class Engine < ::Rails::Engine
    paths.app.controllers = File.expand_path("../../../app/controllers", __FILE__)
    paths.app.views       = File.expand_path("../../../app/views", __FILE__)
    paths.config.routes   = File.expand_path("../routes.rb", __FILE__)

    initializer "multiauth" do |app|
      config_file = Rails.root+"config/auth_providers.yml"
      providers = YAML::load(ERB.new(File.read(config_file)).result)
      if providers[Rails.env].nil?
        raise ArgumentError, "cannot find section for #{Rails.env} environment in #{config_file}"
      end

      Multiauth.providers = providers[Rails.env]

      require 'omniauth/openid'
      require 'openid/store/filesystem'

      app.config.middleware.use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp') # FIXME: mm store

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

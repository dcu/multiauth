module Multiauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      namespace 'multiauth'
      desc "initializes the required files"

      def copy_assets
        directory "images", "public/images/"
        copy_file "multiauth.css", "public/stylesheets/multiauth.css"
        copy_file "multiauth.js", "public/javascripts/multiauth.js"
      end

      def copy_config_file
        copy_file "auth_providers.yml", "config/auth_providers.yml"
      end

      def show_readme
        readme "README"
      end

      protected
    end
  end # Generators
end # Multiauth


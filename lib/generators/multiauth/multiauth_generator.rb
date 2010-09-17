module Multiauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      namespace 'multiauth'
      desc "initializes the required files"

      def copy_js
        copy_file "multiauth.js", "public/javascripts/multiauth.js"
      end

      def copy_openid
        directory "openid-realselector", "public/javascripts/openid-realselector"
      end

      def copy_twitter
        copy_file "devise_twitter.rb", "config/initializers/devise_twitter.rb"
      end

      def show_readme
        readme "README"
      end

      protected
    end
  end # Generators
end # Multiauth


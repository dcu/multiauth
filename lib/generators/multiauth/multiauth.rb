module Multiauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "initializes the required files"

      def copy_openid_selector
        copy_directory "openid-realselector", "public/javascripts/openid-realselector"
      end
    end
  end # Generators
end # Multiauth


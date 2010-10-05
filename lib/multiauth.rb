require 'multiauth/views_helper'
require 'multiauth/helpers'
require 'multiauth/rails'


module Multiauth
  def self.providers=(providers)
    @providers = providers
  end

  def self.providers
    @providers
  end
end

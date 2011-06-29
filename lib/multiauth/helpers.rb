module Multiauth
  module Helpers
    def self.included(base)
      base.class_eval do
        helper_method :logged_in?
      end
    end

    def logged_in?
      !!self.current_user
    end
  end
end
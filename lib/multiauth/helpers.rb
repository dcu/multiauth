module Multiauth
  module Helpers
    def self.included(base)
      base.class_eval do
        helper_method :current_user, :logged_in?
      end
    end

    def current_user=(new_user)
      session[:user] = (new_user.nil? || new_user.is_a?(Symbol)) ? nil : new_user.id
      @current_user = new_user
    end

    def current_user
      @current_user ||= User.find(session[:user]) if session[:user]
    end

    def logged_in?
      !!self.current_user
    end
  end
end
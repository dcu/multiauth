module Multiauth
  class SessionsController < ApplicationController
    def new
    end

    def auth
      # see http://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
      if logged_in?
        self.current_user.connect(params['auth'] || request.env['rack.auth'])
      else
        self.current_user = User.authenticate(params['auth'] || request.env['rack.auth'])
      end

      if logged_in?
        redirect_to session[:return_to] ? session[:return_to] : root_path
      else
        render 'new'
      end
    end

    def failure
      flash.now[:error] = params[:message]
      render 'new'
    end

    def destroy
      self.current_user = nil
      redirect_to root_path
    end

    protected
  end
end

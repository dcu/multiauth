module Multiauth
  class SessionsController < Devise::OmniauthCallbacksController
    def auth
      # see http://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
      fields = env["omniauth.auth"] || request.env['rack.auth']

      puts ">>>>>>>>> #{user_signed_in?} #{self.current_user}"
      if user_signed_in?
        self.current_user.connect(fields)
        redirect_to user_path(self.current_user)
        return
      elsif (@user = User.authenticate(fields)) && (!@user.new_record?)
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => fields["provider"].titleize
        self.current_user = @user
        sign_in_and_redirect(@user, :event => :authentication)
        return
      end

      redirect_to new_session_path(:user)
    end
    alias_method :twitter, :auth
    alias_method :identica, :auth
    alias_method :open_id, :auth
    alias_method :linked_in, :auth
    alias_method :facebook, :auth

    protected
  end
end

require 'multiauth/rails'
require 'multiauth/views_helper'

module Multiauth
  PROVIDERS = {
    'Google' => {
      :url => 'https://www.google.com/accounts/o8/id'
    },
    'Twitter' => {
      :url => '/users/sign_in/twitter',
      :real => true
    },
    'Facebook' => {
      :url => lambda { oauth_authorize_url(resource_name, :facebook) },
      :real => true
    },
    'Yahoo' => {
      :url => 'http://yahoo.com/'
    },
    'AOL' => {
      :url => 'http://openid.aol.com/{user_name}'
    },
    'MySpace' => {
      :url => 'http://www.myspace.com/{user_name}'
    },
    'Github' => {
      :url => lambda { oauth_authorize_url(resource_name, :github) },
      :real => true
    },
    'MyOpenID' => {
      :url => 'http://{user_name}.myopenid.com/'
    },
    'Wordpress' => {
      :url => 'http://{user_name}.wordpress.com/'
    },
    'Blogger' => {
      :url => 'http://{user_name}.blogspot.com/'
    },
    'Flickr' => {
      :url => 'http://flickr.com/{user_name}/'
    },
    'Launchpad' => {
      :url => 'https://launchpad.net/~{user_name}'
    },
    'Vidoop' => {
      :url => 'http://{user_name}.myvidoop.com/'
    },
    'ClaimID' => {
      :url => 'http://claimid.com/{user_name}'
    },
    'Technorati' => {
      :url => 'http://technorati.com/people/technorati/{user_name}/'
    },
    'Verisign' => {
      :url => 'http://{user_name}.pip.verisignlabs.com/'
    },
    'LiveJournal' => {
      :url => 'http://{user_name}.livejournal.com'
    },
    'OpenID' => {
      :url => '{user_name}'
    }
  }
end

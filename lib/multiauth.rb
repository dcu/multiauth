require 'multiauth/rails'
require 'multiauth/views_helper'

module Multiauth
  PROVIDERS = {
    'Google' => {
      :url => 'https://www.google.com/accounts/o8/id'
    },
    'Yahoo' => {
      :url => 'http://yahoo.com/'
    },
    'Twitter' => {
      :url => '/users/sign_in/twitter',
      :real => true
    },
    'Launchpad' => {
      :url => 'https://launchpad.net/~{user_name}'
    },
    'Facebook' => {
      :url => lambda { oauth_authorize_url(resource_name, :facebook) },
      :real => true
    },
    'OpenID' => {
      :url => '{user_name}'
    },
    'Github' => {
      :url => lambda { oauth_authorize_url(resource_name, :github) },
      :real => true
    },
    'AOL' => {
      :user_name_txt => 'screen:name',
      :url => 'http://openid.aol.com/{user_name}'
    },
    'MyOpenID' => {
      :url => 'http://{user_name}.myopenid.com/'
    },
    'Flickr' => {
      :url => 'http://flickr.com/{user_name}/'
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
    'Wordpress' => {
      :url => 'http://{user_name}.wordpress.com/'
    },
    'Blogger' => {
      :url => 'http://{user_name}.blogspot.com/'
    },
    'Verisign' => {
      :url => 'http://{user_name}.pip.verisignlabs.com/'
    },
    'LiveJournal' => {
      :url => 'http://{user_name}.livejournal.com'
    },
    'MySpace' => {
      :url => 'http://www.myspace.com/{user_name}'
    }
  }
end

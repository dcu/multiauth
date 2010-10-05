require 'multiauth/views_helper'
require 'multiauth/helpers'
require 'multiauth/rails'


module Multiauth
  PROVIDERS = {
    'Google' => {
      :url => '/auth/open_id?openid_url=https://www.google.com/accounts/o8/id'
    },
    'Twitter' => {
      :url => '/auth/twitter',
      :real => true
    },
    'Facebook' => {
      :url => '/auth/facebook',
      :real => true
    },
    'Yahoo' => {
      :url => '/auth/open_id?openid_url=http://yahoo.com/'
    },
    'AOL' => {
      :url => '/auth/open_id?openid_url=http://openid.aol.com/{user_name}'
    },
    'MySpace' => {
      :url => '/auth/open_id?openid_url=http://www.myspace.com/{user_name}'
    },
    'Github' => {
      :url => '/auth/github',
      :real => true
    },
    'MyOpenID' => {
      :url => '/auth/open_id?openid_url=http://{user_name}.myopenid.com/'
    },
    'Wordpress' => {
      :url => '/auth/open_id?openid_url=http://{user_name}.wordpress.com/'
    },
    'Blogger' => {
      :url => '/auth/open_id?openid_url=http://{user_name}.blogspot.com/'
    },
    'Flickr' => {
      :url => '/auth/open_id?openid_url=http://flickr.com/{user_name}/'
    },
    'Launchpad' => {
      :url => '/auth/open_id?openid_url=https://launchpad.net/~{user_name}'
    },
    'Vidoop' => {
      :url => '/auth/open_id?openid_url=http://{user_name}.myvidoop.com/'
    },
    'ClaimID' => {
      :url => '/auth/open_id?openid_url=http://claimid.com/{user_name}'
    },
    'Technorati' => {
      :url => '/auth/open_id?openid_url=http://technorati.com/people/technorati/{user_name}/'
    },
    'Verisign' => {
      :url => '/auth/open_id?openid_url=http://{user_name}.pip.verisignlabs.com/'
    },
    'LiveJournal' => {
      :url => '/auth/open_id?openid_url=http://{user_name}.livejournal.com'
    },
    'OpenID' => {
      :url => '/auth/open_id'
    }
  }
end

require 'multiauth/rails'
require 'multiauth/views_helper'

module Multiauth
  PROVIDERS = [
    {
      :name => 'Google',
      :url => 'https://www.google.com/accounts/o8/id'
    },
    {
      :name => 'Yahoo',
      :url => 'http://yahoo.com/'
    },
    {
      :name => 'Twitter',
      :url => '/users/sign_in/twitter',
      :real => true
    },
    {
      :name => 'Facebook',
      :selector => '#facebook_signin', # FIXME
      :real => true
    },
    {
      :name => 'Launchpad',
      :url => 'https://launchpad.net/~{user_name}'
    },
    {
      :name => 'Github',
      :url => '#github_signin', # FIXME
      :real => true
    },
    {
      :name => 'AOL',
      :user_name_txt => 'screen:name',
      :url => 'http://openid.aol.com/{user_name}'
    },
    {
      :name => 'OpenID',
      :user_name_txt => ':url'
    },
    {
      :name => 'MyOpenID',
      :url => 'http://{user_name}.myopenid.com/'
    },
    {
      :name => 'Flickr',
      :url => 'http://flickr.com/{user_name}/'
    },
    {
      :name => 'Vidoop',
      :url => 'http://{user_name}.myvidoop.com/'
    },
    {
      :name => 'ClaimID',
      :url => 'http://claimid.com/{user_name}'
    },
    {
      :name => 'Technorati',
      :url => 'http://technorati.com/people/technorati/{user_name}/'
    },
    {
      :name => 'Wordpress',
      :url => 'http://{user_name}.wordpress.com/'
    },
    {
      :name => 'Blogger',
      :url => 'http://{user_name}.blogspot.com/'
    },
    {
      :name => 'Verisign',
      :url => 'http://{user_name}.pip.verisignlabs.com/'
    },
    {
      :name => 'LiveJournal',
      :url => 'http://{user_name}.livejournal.com'
    },
    {
      :name => 'MySpace',
      :url => 'http://www.myspace.com/{user_name}'
    }
  ]
end

/*
OpenID Plugin
http://code.google.com/p/openid-realselector/

Martin Conte Mac Donell <Reflejo@gmail.com>
*/

(function($) {
  $.fn.openid = function(opt) {
    var gprovider;
    var INPUTID = 'openid_username';
    var inputarea = $('#openid_inputarea').length ? $('#openid_inputarea'): $('<div id="openid_inputarea" />');

    var defaults = {
      txt: {
        label: 'Enter your {provider} {username}',
        username: 'username',
        title: 'Select your openID provider',
        sign: 'Sign-In'
      },
      /*
       Default providers with url. "big" variable means that icon
       will be big.
      */
      providers: [
        {
          name: 'Google',
          url: 'https://www.google.com/accounts/o8/id',
          label: null,
          big: true
        },
        {
          name: 'Yahoo',
          url: 'http://yahoo.com/',
          label: null,
          big: true
        },
        {
          name: 'Twitter',
          url: '/users/sign_in/twitter',
          real: true,
          big: true
        },
        {
          name: 'Facebook',
          selector: '#facebook_signin',
          real: true,
          big: true
        },
        {
          name: 'Launchpad',
          url: 'https://launchpad.net/~{username}',
          big: true
        },
        {
          name: 'Github',
          selector: '#github_signin',
          real: true,
          big: true
        },
        {
          name: 'AOL',
          username_txt: 'screenname',
          url: 'http://openid.aol.com/{username}',
          big: true
        },
        {
          name: 'OpenID',
          username_txt: 'url',
          big: true
        },
        {
          name: 'MyOpenID',
          url: 'http://{username}.myopenid.com/'
        },
        {
          name: 'Flickr',
          url: 'http://flickr.com/{username}/'
        },
        {
          name: 'Vidoop',
          url: 'http://{username}.myvidoop.com/'
        },
        {
          name: 'ClaimID',
          url: 'http://claimid.com/{username}'
        },
        {
          name: 'Technorati',
          url: 'http://technorati.com/people/technorati/{username}/'
        },
        {
          name: 'Wordpress',
          url: 'http://{username}.wordpress.com/'
        },
        {
          name: 'Blogger',
          url: 'http://{username}.blogspot.com/'
        },
        {
          name: 'Verisign',
          url: 'http://{username}.pip.verisignlabs.com/'
        },
        {
          name: 'LiveJournal',
          url: 'http://{username}.livejournal.com'
        },
        {
          name: 'MySpace',
          url: 'http://www.myspace.com/{username}'
        }
      ],
      cookie_expires: 6 * 30, // in days.
      cookie_path: '/',
      img_path: '/img/'
    };

    var getBox = function(provider, idx) {
      var a = $('<a id="btn_'+ idx+ '" class="'+provider.name+' openid_btn" title="' + provider.name + '" href="#" />');

      if(provider.real) {
        if(provider.url){
          a.attr("href", provider.url);
        } else {
          var target = $(provider.selector);
          a.attr("href", target.attr('href'));
          target.remove();
        }
        return a;
      }

      a.click(signIn)
      return a;
    };

    var setCookie = function(value) {
      var date = new Date();
      date.setTime(date.getTime() + (settings.cookie_expires * 24 * 60 * 60 * 1000));
      document.cookie = "openid_prov=" + value + "; expires=" + date.toGMTString() +
                        "; path=" + settings.cookie_path;
    };

    var readCookie = function(){
      var c = document.cookie.split(';');
      for(i in c){
        if ((pos = c[i].indexOf("openid_prov=")) != -1)
          return $.trim(c[i].slice(pos + 12));
      }
    };

    var signIn = function(obj, tidx) {
      var idx = $(tidx || this).attr('id').replace('btn_', '');
      if (!(gprovider = settings.providers[idx]))
        return;

      // prompt user for input?
      showInputBox();
      if (gprovider.label === null) {
        inputarea.text(settings.txt.title);
        if (!tidx) {
          inputarea.fadeOut();
          form.submit();
        }
      }
      return false;
    };

    var showInputBox = function() {
      var lbl = (gprovider.label || settings.txt.label).replace(
        '{username}', (gprovider.username_txt !== undefined) ? gprovider.username_txt: settings.txt.username
      ).replace('{provider}', gprovider.name);

      inputarea.empty().show().append('<span class="oidlabel">' + lbl + '</span><input id="' + INPUTID + '" type="text" ' +
        ' name="username_txt" class="Verisign"/><input type="submit" value="' + settings.txt.sign + '"/>');

      $('#' + INPUTID).focus();
    };

    var submit = function(){
      var prov = (gprovider.url) ? gprovider.url.replace('{username}', $('#' + INPUTID).val()): $('#' + INPUTID).val();
      form.append($('<input type="hidden" name="'+settings.param+'" value="' + prov + '" />'));
    };

    var settings = $.extend(defaults, opt || {});

    var btns = $('<div id="openid_btns" />');

    var carousel = $('<div id="carousel" />');
    btns.append(carousel);

    carousel.append($('<div id="buttons"><a href="#" id="prev">prev</a><a href="#" id="next">next</a><div class="clear"></div></div>'));
    carousel.append($('<div class="clear"></div>'));
    var slides = $('<div id="slides" />');
    var list = $('<ul class="list"></ul>');
    var column = null;
    var page = null;

    // Add box for each provider
    var addbr = true;
    $.each(settings.providers, function(i, val) {
      if(i % 6 == 0){
        page = $('<li class="page"/>');
        list.append(page);
      }

      if(i % 3 == 0){
        column = $('<div class="column" />');
        page.append(column);
      }

      column.append(getBox(val, i));
    });
    slides.append(list);
    slides.append($('<div class="clear" />'));
    carousel.append(slides);

    var form = this;
    form.css({'background-image': 'none'});
    form.append(btns).submit(submit);
    btns.append(inputarea);

    if (idx = readCookie())
      signIn(null, '#btn_' + idx);
    else
    inputarea.text(settings.txt.title).show();

    var carouselEffect = function() {
        var rotate = function() {
          $('#next').click();
        }

        var speed = 5000;
        var run = setInterval(rotate, speed);

        var item_width = $('#slides .list .page').outerWidth();
        var left_value = item_width * (-1);

        $('#slides .page:first').before($('#slides .list .page:last'));
        $('#slides .list').css({'left' : left_value});

        $('#prev').click(function() {
            var left_indent = parseInt($('#slides .list').css('left')) + item_width;
            $('#slides .list:not(:animated)').animate({'left' : left_indent}, 200,function(){
                $('#slides .page:first').before($('#slides .page:last'));
                $('#slides .list').css({'left' : left_value});
            });
            return false;
        });

        $('#next').click(function() {
            var left_indent = parseInt($('#slides .list').css('left')) - item_width;

            $('#slides .list:not(:animated)').animate({'left' : left_indent}, 200, function () {
                $('#slides .page:last').after($('#slides .page:first'));
                $('#slides .list').css({'left' : left_value});
            });

            return false;
        });

        $('#slides').hover(
            function() {
              clearInterval(run);
            },
            function() {
              run = setInterval(rotate, speed);
            }
        );
    }

    carouselEffect();

    return this;
  };
})(jQuery);

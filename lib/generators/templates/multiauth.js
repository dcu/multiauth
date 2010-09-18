function openidCarouselEffect() {
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


jQuery(function ($) {
  var $form = $("form#openid");
  var $identity_url = $form.find("input#identity_url");
  var $input_area = $form.find("#openid_inputarea");
  var $input_username = $input_area.find("input#openid_username");

  $form.find("#nojsopenid").hide();

  $form.css({'background-image': 'none'});

  $input_area.find("#close_openid_inputarea").click(function() {
    $input_area.fadeOut();
    return false;
  });

  $form.find(".openid_btn").click(function(e){
    var a = $(this);

    if(a.attr("href").match("{user_name}")) {
      $input_username.attr("data-provider", a.attr("href"));
      $(".oidlabel").text(a.attr("title")+" id:");

      $input_area.css({left:e.pageX-20, top:e.pageY-25});
      $input_area.fadeIn();
      return false;
    }

    if(a.attr("data-real") == "false") {
      $identity_url.val(a.attr("href"));
      $form.submit();
      return false;
    }

    return true;
  });

  $form.find("#openid_inputarea_submit").click(function() {
    var v = $input_username.val();
    if(v) {
      $identity_url.val($input_username.attr("data-provider").replace("{user_name}",v ));
    }
  });

  openidCarouselEffect();
});

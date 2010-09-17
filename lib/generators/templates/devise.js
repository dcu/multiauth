jQuery(function ($) {
  var oid = $("#openid");

  if(oid.lenght > 0) {
    $("form#openid #nojsopenid").remove();
    $("#openid").openid({
      img_path: '/javascripts/openid-realselector/img/',
      param: 'user[identity_url]'
    })
  }
});

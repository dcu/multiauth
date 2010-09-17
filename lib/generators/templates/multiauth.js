jQuery(function ($) {
  var oid = $("#openid");

  if(oid.length > 0) {
    $("form#openid #nojsopenid").remove();
    $("#openid").openid({
      img_path: '/javascripts/openid-realselector/img/',
      param: 'user[identity_url]'
    })
  }
});

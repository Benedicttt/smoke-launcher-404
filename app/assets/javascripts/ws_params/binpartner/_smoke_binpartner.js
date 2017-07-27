$(function(){
  $('#smoke-binpartner').click(function(){
    $('.ws label').css('color','yellow').text("Tests runs, expect...")
    $(".step_cucumber").click();
    $(".start").click();
    window.scrollTo(0, 999999);

    w.send(JSON.stringify({
      smoke_binpartner: true,  //!!!!!
      count_features: get_data(),
      thread: $('#generator_thread').val(),
      clear_cache: $('#generator_clear_clear_cache').prop('checked'),
      proxy_server: $('#generator_proxy_server').val(),
      proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
    }));

    notify_status_testing();
    return false;
  })

})

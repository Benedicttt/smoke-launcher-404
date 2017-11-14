$(function(){
  $('#smoke-status-code').click(function(){
    $('.ws label').css('color','yellow').text("Tests runs, expect...")
    $(".step_cucumber").click();
    $(".start").click();
    window.scrollTo(0, 999999);

    w.send(JSON.stringify({
      smoke_status_code: true,  //!!!!!
      count_features: get_data(),
      thread: $('#generator_thread').val(),
      clear_cache: $('#generator_clear_clear_cache').prop('checked'),
      geo: $('#generator_geo').val(),
      proxy_server: $('#generator_proxy_server').val(),
      proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
      response_http: $('#generator_display_return_only_response__200').prop('checked'),
      not_response_http: $('#generator_display_return_only_response__400').prop('checked'),
      param_headless: $('#generator_param_headless').val(),
    }));

    notify_status_testing();
    return false;
  })


})

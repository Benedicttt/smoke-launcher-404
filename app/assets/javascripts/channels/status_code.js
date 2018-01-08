$(function() {
  if ($('.ws_sender').attr('id') == "smoke-status-code") {
    App.status_code = App.cable.subscriptions.create({
      channel: "StatusCodeChannel"
    });

    $('.pid_process').click(function(){
      $('.stop').click()
      App.status_code.send(JSON.stringify({
        pid_cucumber: "pid_cucumber"
      }))
    });

};

    $('#smoke-status-code').click(function(){
      $('.ws label').css('color','yellow').text("Tests runs, expect...")
      $(".step_cucumber").click();
      $(".start").click();
      window.scrollTo(0, 999999);

      App.status_code.send(JSON.stringify({
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
});

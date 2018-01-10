$(function() {
  if ($('.ws_sender').attr('id') == "smoke-binpartner") {
    App.smoke_binpartner = App.cable.subscriptions.create("SmokeBinpartnerChannel",
    received: function() {
      function_handler_start("Run Smoke test Binpartner")
      function_handler_done("Done Smoke test Binpartner")
    }
    });

    $('.pid_process').click(function(){
      $('.stop').click()
      App.smoke_binpartner.send(JSON.stringify({
        pid_cucumber: "pid_cucumber"
      }))
    });

};

    $('#smoke-binpartner').click(function(){

      $(".step_cucumber").click();
      $(".start").click();
      window.scrollTo(0, 999999);

      App.smoke_binpartner.send(JSON.stringify({
        smoke_binpartner: true,  //!!!!!
        count_features: get_data(),
        thread: $('#generator_thread').val(),
        clear_cache: $('#generator_clear_clear_cache').prop('checked'),
        proxy_server: $('#generator_proxy_server').val(),
        proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
        ip_address: App.config.ip,
        param_headless: $('#generator_param_headless').val(),

      }));

      return false;
  })
});

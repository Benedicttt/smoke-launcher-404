$(function() {
  if ($('.ws_sender').attr('id') == "smoke-content-pages") {
    App.content_page = App.cable.subscriptions.create({
      channel: "ContentPageChannel"
    })};

    $('#smoke-content-pages').click(function(){
      $('.ws label').css('color','yellow').text("Tests runs, expect...")
      $(".step_cucumber").click();
      $(".start").click();
      window.scrollTo(0, 999999);

      App.content_page.send(JSON.stringify({
          smoke_content_pages: true,  //!!!!!
          sleep_retried: $('#generator_sleep_retried').val(),
          thread: $('#generator_thread').val(),
          clear_cache: $('#generator_clear_clear_cache').prop('checked'),
          geo: $('#generator_geo').val(),
          proxy_server: $('#generator_proxy_server').val(),
          proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
          ip_address: App.config.ip,
          param_headless: $('#generator_param_headless').val(),
          count_features: get_data()
      }));

      notify_status_testing();
      return false;
  })
});

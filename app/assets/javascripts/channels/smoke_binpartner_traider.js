$(function() {
  if ($('.ws_sender').attr('id') == "smoke-binpartner-trader") {
    App.smoke_binpartner_traider = App.cable.subscriptions.create({
      channel: "SmokeBinpartnerTraiderChannel"
    });

    $('.pid_process').click(function(){
      $('.stop').click()
      App.smoke_binpartner_traider.send(JSON.stringify({
        pid_cucumber: "pid_cucumber"
      }))
    });

};

    $('#smoke-binpartner-trader').click(function(){
      $('.ws label').css('color','yellow').text("Tests runs, expect...")
      $(".step_cucumber").click();
      $(".start").click();
      window.scrollTo(0, 999999);

      App.smoke_binpartner_traider.send(JSON.stringify({
        smoke_binpartner_traider: true, //!!!!!

        sleep_retried: $('#generator_sleep_retried').val(),
        tariff: $('#generator_tariff').val(),
        between: $('.count_between').val(),
        count_cashier: $('.count_cashier').val(),
        count_cashier_dep: $('.count_cashier_dep').val(),
        count_payouts: $('.count_payouts').val(),
        count_payouts_sum: $('.count_payouts_sum').val(),
        count_deals: $('.count_deals').val(),
        count_deals_sum: $('.count_deals_sum').val(),
        count_pay_approve: $('.count_pay_approve').val(),
        bonus_dep: $("#generator_scenario_cancel_bonus").prop('checked'),
        turbo: $("#generator_scenario_turbo").prop('checked'),
        binary: $("#generator_scenario_binary").prop('checked'),
        count_features: get_data(),
        refcode: $('.refcode').val(),
        thread: $('#generator_thread').val(),
        yopmail : $('#generator_scenario_yopmail').prop('checked'),
        clear_cache: $('#generator_clear_clear_cache').prop('checked'),
        plus_rspec: $('#generator_plus_rspec').prop('checked'),
        geo: $('#generator_geo').val(),
        proxy_server: $('#generator_proxy_server').val(),
        proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
        ip_address: App.config.ip,
        param_headless: $('#generator_param_headless').val(),

      }));

      notify_status_testing();
      return false;
  })
});

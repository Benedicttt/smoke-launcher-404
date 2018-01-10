$(function() {
  if ($('.ws_sender').attr('id') == "smoke-tournaments") {
    App.tournaments = App.cable.subscriptions.create("TournamentsChannel", {
      received: function() {
        function_handler_start("Run Smoke test Tournament")
        function_handler_done("Done Smoke test Tournament")

        function_stop_stop("KILL PROCCESS TEST")
      }
   });

    $('.pid_process').click(function(){
      $('.stop').click()
      App.tournaments.send(JSON.stringify({
        pid_cucumber: "pid_cucumber"
      }))
    });

};

    $('#smoke-tournaments').click(function(){

      $(".step_cucumber").click();
      $(".start").click();
      window.scrollTo(0, 999999);

      App.tournaments.send(JSON.stringify({
        smoke_tournaments: true,  //!!!!!
        sleep_retried: $('#generator_sleep_retried').val(),
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
        thread: $('#generator_thread').val(),
        yopmail : $('#generator_scenario_yopmail').prop('checked'),
        clear_cache: $('#generator_clear_clear_cache').prop('checked'),
        geo: $('#generator_geo').val(),
        proxy_server: $('#generator_proxy_server').val(),
        proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
        data_from: '"' + $('#generator_data_tournaments_from').val() + '"',
        data_to: '"' + $('#generator_data_tournaments_to').val() + '"',
        ip_address: App.config.ip,
        param_headless: $('#generator_param_headless').val(),
        count_tournaments: $("#generator_count").val()
      }));

      return false;
  })
});

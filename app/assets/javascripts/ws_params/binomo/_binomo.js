$(function(){
  $('#smoke-binomo').click(function(){
    $('.ws label').css('color','yellow').text("Tests runs, expect...")
    $(".step_cucumber").click();
    $(".start").click();
    window.scrollTo(0, 999999);

    w.send(JSON.stringify({
      smoke_binomo: true,  //!!!!!
      sleep_retried: $('#generator_sleep_retried').val(),
      between: $('.count_between').val(),
      count_cashier: $('.count_cashier').val(),
      count_cashier_dep: $('.count_cashier_dep').val(),
      count_payouts: $('.count_payouts').val(),
      count_payouts_sum: $('.count_payouts_sum').val(),
      count_deals: $('.count_deals').val(),
      count_deals_sum: $('.count_deals_sum').val(),
      count_comments: $('.count_comments').val(),
      count_tickets: $('.count_tickets').val(),
      count_pay_approve: $('.count_pay_approve').val(),
      count_sleep: $('.count_sleep').val(),
      bonus_dep: $("#generator_scenario_cancel_bonus").prop('checked'),
      turbo: $("#generator_scenario_turbo").prop('checked'),
      binary: $("#generator_scenario_binary").prop('checked'),
      count_features: get_data(),
      thread: $('#generator_thread').val(),
      yopmail : $('#generator_scenario_yopmail').prop('checked'),
      clear_cache: $('#generator_clear_clear_cache').prop('checked'),
      plus_rspec: $('#generator_plus_rspec').prop('checked'),
      geo: $('#generator_geo').val(),
      proxy_server: $('#generator_proxy_server').val(),
      proxy_http: "--proxy-server=" + $('#generator_proxy_http').val(),
    }));

    notify_status_testing();
    return false;
  })


})

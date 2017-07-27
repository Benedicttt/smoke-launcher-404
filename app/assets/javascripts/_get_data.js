function get_data(checkbox){
    var str = "";

    if ($(".chk option").is('option:selected') == true){
      str += "stage=" + $(".chk option:selected").val() + " ";

    }
    if ( $(".drv option").is('option:selected') == true){
      str += "driver=" + $(".drv option:selected").val() + " ";
    }
    if ($('.currency option').is('option:selected') == true){
      str += "cur=" + $(".currency option:selected").val() + " ";
    }
    if ($('.locale option').is('option:selected') == true){
      str += "locale=" + $(".locale option:selected").val() + " ";
    }
    if ($('.framework option').is('option:selected') == true){
      str += " " + $(".framework option:selected").val() + " ";
    }
    if ($('.tariff option').is('option:selected') == true){
      str += " t=" + $(".tariff option:selected").val() + " ";
    }

   if ($('#smoke-recovery-password').prop('click')) {
     (".global_link").val(str += "-f html > ./public/reports/binomo/smoke-recovery-password.html ./features/recovery-password.feature")
   };

   if ($('#screen-shots').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binomo/screen-shots.html ./features/screen-shots.feature")
   };

   if ($('#smoke-push').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binomo/smoke-push.html ./features/push-notifications.feature")
   };

   if ($('#smoke-binomo').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binomo/smoke-binomo.html ./features/smoke-binomo.feature")
   };

   if ($('#smoke-email-marketing').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binomo/smoke-email-marketing.html ./features/email-marketing.feature")
   };

   if ($('#smoke-status-code').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binomo/smoke-status-code.html ./features/smoke-status-code.feature")
   };

   if ($('#smoke-binpartner').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binpartner/smoke-binpartner.html ./features/created-partner.feature")
   };

   if ($('#smoke-binpartner-trader').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binpartner/smoke-binpartner-trader.html ./features/binpartner-treder.feature")
   };

   if ($('#smoke-tournaments').prop('click')) {
     $(".global_link").val(str += "-f html > ./public/reports/binomo/smoke-tournaments.html ./features/tournaments.feature")
   };

   if ($('#api-request').prop('click')) {
     if ($('#generator_api_select_reg_web_api').prop('checked') == true | $('#generator_api_select_confirmed_quality').prop('checked') == true) {
       $('.global_link').val(str += '')
     }
     else
     $(".global_link").val(str += "-f html > ./public/reports/api-request.html ")
   };

   if ($('#landings').prop('click')) {
     if ($('#generator_scenario_smoke_prod').prop('checked') == true) {
       $(".global_link").val(str += "-f html > ./public/reports/prod/production.html ./features/production.feature")
     }
     else
     $('.global_link').val(str += '')
   };

   if ($('#generator_api_select_confirmed_quality').prop('checked') == true || $('#generator_api_select_reg_web_api').prop('checked') == true || $('#generator_api_select_pack_1').prop('checked') == true ) {
     $(".global_link").val(str += "./features/quality_reg_api.feature"); }
   else if ($('#generator_api_select_confirmed_quality').prop('checked') == false) {
     $(".global_link").val(str += " ./features/generate.feature");
   }

    return str;

  };

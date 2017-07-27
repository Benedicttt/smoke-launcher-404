$(function(){

  $(".check_boxes").on("change", toggleInputVisibility)
    function toggleInputVisibility(){

      if ($("#generator_scenario_confirmed").is(':checked')) $('#generator_scenario_temp-mail').attr('checked', true)

      if ($('.reg-binomo').is(':checked')) $('.count_reg').show(), $('.auth-binomo').hide()
        else $('.count_reg').hide(), $('.auth-binomo').hide()

      if ($('#generator_scenario_authorization').is(':checked')) $("label:contains('reg_traider_refcode'),  #generator_scenario_reg_traider_refcode").hide().attr('checked', false)
        else $("label:contains('reg_traider_refcode'), #generator_scenario_reg_traider_refcode").show().attr('checked', true)

      if ($('#generator_scenario_reg_traider_refcode').is(':checked')) $("label:contains('authorization'),#generator_scenario_authorization").hide().attr('checked', false)
        else $("label:contains('authorization'), #generator_scenario_authorization").show().attr('checked', true)

      if ($('#generator_scenario_cashier').is(':checked') || $('#generator_api_select_cashier_ios').is(':checked') || $('#generator_api_select_cashier_android').is(':checked'))  $("label:contains('Cashier count'), .bonus_cashier_api, label:contains('Cashier sum'), .bonus_part, .count_cashier, .count_cashier_dep, .count_sleep").show(), $('body > div > form > div.form-part.text-form > div:nth-child(4) > div:nth-child(2) > div').show()
        else $("label:contains('Cashier count'), label:contains('Cashier sum'),  .count_cashier, .count_cashier_dep, .bonus_cashier_api, .bonus_part, .count_sleep").hide(), $('body > div > form > div.form-part.text-form > div:nth-child(4) > div:nth-child(2) > div').hide()

      if ($('#generator_scenario_payouts').is(':checked') || $('#generator_api_select_payouts_ios').is(':checked') || $('#generator_api_select_payouts_android').is(':checked')) $("label:contains('Pay count'), .count_payouts").show()
        else $("label:contains('Pay count'), .count_payouts").hide()

      if ($('#generator_scenario_payouts').is(':checked') || $('#generator_api_select_payouts_ios').is(':checked') || $('#generator_api_select_payouts_android').is(':checked')) $("label:contains('Pay sum'), .count_payouts_sum").show()
        else $("label:contains('Pay sum'), .count_payouts_sum").hide()

      if ($('#generator_scenario_payment_approve_crm').is(':checked')) $('.count_pay_approve').show()
        else $('.count_pay_approve').hide()

      if ($('#generator_scenario_deals').is(':checked') || $('#generator_api_select_deals_ios').is(':checked') || $('#generator_api_select_deals_android').is(':checked')) $(".count_deals, .count_deals_sum, label[for='generator_scenario_win'],label[for='generator_scenario_lose'], label:contains('Deal count'), label:contains('Deal sum'), #generator_scenario_win, .between,  #generator_scenario_lose, label:contains('Sum deals'), label:contains('Count deals'), label:contains('Delay between deals'), #generator_scenario_turbo, label:contains('turbo'), #generator_scenario_binary, label:contains('binary')").show()
        else $("  label[for='generator_scenario_win'],label[for='generator_scenario_lose'], label:contains('Deal count'), label:contains('Deal sum'),  .count_deals, .count_deals_sum, #generator_scenario_win, .between,  #generator_scenario_lose, label:contains('Sum deals'), label:contains('Count deals'), label:contains('Delay between deals'), #generator_scenario_turbo, label:contains('turbo'), #generator_scenario_binary, label:contains('binary')").hide()

      if ($('#generator_scenario_welcome').is(':checked')) $('.count_welcome_first_name, .count_welcome_last_name ').show()
        else $('.count_welcome_first_name, .count_welcome_last_name ').hide()

      if ($('#generator_scenario_comment_crm').is(':checked')) $('.count_comments').show()
        else $('.count_comments').hide()

      if ($('#generator_scenario_ticket_crm').is(':checked')) $('.count_tickets').show()
        else $('.count_tickets').hide()

      if ($('#generator_scenario_payments_approve_crm').is(':checked')) $('.count_pay_approve').show()
        else $('.count_pay_approve').hide()

        $('#generator_scenario_reg_traider_refcode').click()
    }
  toggleInputVisibility()
})

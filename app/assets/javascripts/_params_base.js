$(function(){

  $('#generator_global_ckeckbox_check').click(function(){
    $('.check_boxes').click();
  });

  $('#generator_currency').click(function(){
   if ($('#generator_currency').val() == "RUB"){
     $('.count_cashier_dep').val('16000');
     $('.count_payouts_sum').val('500');
     $('.count_deals_sum').val('101');
   }
   if ($('#generator_currency').val() == "USD"){
     $('.count_cashier_dep').val('200');
     $('.count_payouts_sum').val('10');
     $('.count_deals_sum').val('1');
   }
   if ($('#generator_currency').val() == "EUR"){
     $('.count_cashier_dep').val('150');
     $('.count_payouts_sum').val('11');
     $('.count_deals_sum').val('2');
    }
  });
})

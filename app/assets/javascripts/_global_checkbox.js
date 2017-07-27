$(function(){

    $('.chk .select').click(function(){
       var str = "";
       if( $(".chk option:selected").length != 0){
         str += $(".chk option:selected").val();
       }
       else if($('.chk option:selected').length == 0){
      }
      $('.global_link').val(get_data())
    });


    $('.drv .select').click(function(){
       var str = "";
       if($('.drv option:selected').length != 0){
         str += $(".drv option:selected").val();
       }
       else if($('.drv option:selected').length == 0){
       }
      $('.global_link').val(get_data())
    });

    $('.locale .select').click(function(){
       var str = "";
       if($('.locale option:selected').length != 0){
         str += $(".locale option:selected").val();
       }
       else if($('.locale option:selected').length == 0){
       }
      $('.global_link').val(get_data())
    });


    $('.currency .select').click(function(){
       var str = "";
       if($('.currency option:selected').length != 0){
         str += $(".currency option:selected").val();

       }
       else if($('.currency option:selected').length == 0){
       }
      $('.global_link').val(get_data())
    });


    $('.framework .select').click(function(){
       var str = "";
       if($('.framework option:selected').length != 0){
         str += $(".framework option:selected").val();
       }
       else if($('.framework option:selected').length == 0){
       }
      $('.global_link').val(get_data())
    });
     //
    //  $('.check-1').click(function(){$('.part-screen-1').click()});
    //  $('.check-2').click(function(){$('.part-screen-2').click()});
    //  $('.check-3').click(function(){$('.part-screen-3').click()});
    //  $('.check-4').click(function(){$('.part-screen-4').click()});
    //  $('.check-5').click(function(){$('.part-screen-5').click()});
    //  $('.check-6').click(function(){$('.part-screen-6').click()});
    //  $('.check-7').click(function(){$('.part-screen-7').click()});
    //  $('.check-8').click(function(){$('.part-screen-8').click()});

});

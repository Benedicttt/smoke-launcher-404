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

});

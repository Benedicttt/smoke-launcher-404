$(function(){

  $('.restart_unicorn_first').click(function(){
    if (str= '', $('.restart_unicorn_first').prop('click')) {
      $("#_global_link").val(str += " cap" + " " +
      $('#first-binomo').val() + " project=" +
      $('#first-project').val() + " unicorn:stop" + " && " + "cap" + " " +
      $('#first-binomo').val() + " project=" +
      $('#first-project').val() + " unicorn:start"
    )}


    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      restart: "unicorn"
    }));
    restart_unicorn()
  });
});

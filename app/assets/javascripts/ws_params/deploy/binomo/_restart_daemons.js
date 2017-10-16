$(function(){

  $('.restart_daemons_first').click(function(){
    if (str= '', $('.restart_daemons_first').prop('click')) {
      $("#_global_link").val(str += "cap" + " " +
      $('#first-binomo').val() + " project=" +
      $('#first-project').val() + " daemons:stop"
      + " && " + "cap" + " " +
      $('#first-binomo').val() + " project=" +
      $('#first-project').val() + " daemons:start"
    )}

    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      restart: "daemons"
    }));
    restart_daemons()
  });
});

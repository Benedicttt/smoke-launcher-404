$(function(){

  $('.restart_daemons_last').click(function(){
    if (str= '', $('.restart_daemons_last').prop('click')) {
      $("#_global_link").val(str += "cap" + " " +
      $('#last-binpartner').val() + " project=" +
      $('#last-project').val() + " daemons:stop"
      + " && " + "cap" + " " +
      $('#last-binpartner').val() + " project=" +
      $('#last-project').val() + " daemons:start"
    )}

    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      restart: "daemons"
    }));
    restart_daemons()
  });
});

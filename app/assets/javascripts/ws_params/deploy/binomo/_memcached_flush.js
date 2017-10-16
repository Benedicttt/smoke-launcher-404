$(function(){

    $('.memcached_flush_first').click(function(){
      if (str= '', $('.memcached_flush_first').prop('click')) {
        $("#_global_link").val(str += "cap" + " " +
        $('#first-binomo').val() + " memcached:flush" + " project=" +
        $('#first-project').val()
      )}

    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      memcached: "memcached"
    }));

    deploy_binomo()
  });
});

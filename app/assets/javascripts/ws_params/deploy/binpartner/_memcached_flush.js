$(function(){

  $('.memcached_flush_last').click(function(){
    if (str= '', $('.memcached_flush_last').prop('click')) {
      $("#_global_link").val(str += "bundle exec cap" + " " +
      $('#last-binpartner').val() + " memcached:flush" + " project=" +
      $('#last-project').val()
    )}

    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      memcached: "memcached"
    }));
  });
  deploy_binpartner()
});

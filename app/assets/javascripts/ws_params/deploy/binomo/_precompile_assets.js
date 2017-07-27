$(function(){

  $('.assets_precompile_first').click(function(){
    if (str= '', $('.assets_precompile_first').prop('click')) {
      $("#_global_link").val(str += " cap" + " " +
      $('#first-binomo').val() + " deploy:assets:precompile" + " project=" +
      $('#first-project').val()
    )}

    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      assets: "precompile"
    }));
    precomile_assets()
  });
});

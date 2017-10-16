$(function(){

  $('.assets_precompile_last').click(function(){
    if (str= '', $('.assets_precompile_last').prop('click')) {
      $("#_global_link").val(str += "cap" + " " +
      $('#last-binpartner').val() + " deploy:assets:precompile" + " project=" +
      $('#last-project').val()
    )}

    w.send(JSON.stringify({
      count_deploy: $('#_global_link').val(),
      assets: "precompile"
    }));
  });
  precomile_assets()
});
